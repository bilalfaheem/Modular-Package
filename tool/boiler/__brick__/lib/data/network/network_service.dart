import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/src/media_type.dart';

import '../../domain/failures/network_failure.dart';
import '../../utils/utils.dart';
import 'network.dart';

class NetworkService implements Network {
  // get put post delete
  // Take a URL string as parameter
  // and return Map<String, dynamic> as json
  // And do exception handling
  @override
  Future<Either<NetworkFailure, dynamic>> get(url, header,
      {Map<String, dynamic>? query, String? pathVariable}) async {
    try {
      Utils.logInfo(url.toString(), name: "URL");
      Utils.logInfo(header.toString(), name: "Get Headers");
      Utils.logInfo(query.toString(), name: "Get query");

       var uri;
      if (query == null) {
        uri = Uri.parse(url);
        if (pathVariable != null) {
          uri = Uri.parse(url + "/" + pathVariable);
        }
      } else {
        uri = Uri.parse(url).replace(queryParameters: query);
      }
      Utils.logInfo(uri.toString(), name: "URI");
      var response = await http.get(uri, headers: header);
      final failure = _handleError(response);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(NetworkFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<NetworkFailure, dynamic>> post(
      String url, Map<String, dynamic> data, header) async {
    try {
      Utils.logInfo(url.toString(), name: "Post Url");

      Utils.logInfo(header.toString(), name: "Post Headers");
      Utils.logInfo(data.toString(), name: "Post Data");

      var response = await http.post(Uri.parse(url),
          body: jsonEncode(data), headers: header);
      final failure = _handleError(response);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(NetworkFailure(error: ex.toString()));
    }
  }

  @override
  Future<Either<NetworkFailure, dynamic>> postFile(String url,
      Map<String, dynamic> data, Map<String, dynamic> file, header) async {
    try {
      Utils.logInfo(url.toString(), name: "URL");

      Utils.logInfo(header.toString(), name: "Post Headers");
      Utils.logInfo(file.toString(), name: "Files");
      Utils.logInfo(data.toString(), name: "Data");

      final request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(header!);
      data.forEach((key, value) {
        if (value is List) {
          request.fields[key] =
              jsonEncode(value); // Encode the list to a JSON string
        } else {
          request.fields[key] =
              value; // Convert the value to a string if it's not a list
        }
      });

      if (file.isNotEmpty) {
        await Future.forEach(file.entries, (entry) async {
          if (entry.value.isNotEmpty) {
            if (entry.value is List) {
              for (var i in entry.value) {
                final key = entry.key;
                final filePath = i;
                final fileName = i.split('/').last;
                final contentType = MediaType("image", "${i.split('.').last}");
                final filePart = await http.MultipartFile.fromPath(
                    key, filePath,
                    filename: fileName, contentType: contentType);
                request.files.add(filePart);
              }
            } else {
              final key = entry.key;
              final filePath = entry.value;
              final fileName = entry.value.split('/').last;
              final contentType =
                  MediaType("image", "${entry.value.split('.').last}");
              final filePart = await http.MultipartFile.fromPath(key, filePath,
                  filename: fileName, contentType: contentType);
              request.files.add(filePart);
            }
          }
        });
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      final failure = _handleError(response);

      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(NetworkFailure(error: ex.toString()));
    }
  }

  // NetworkFailure? _handleError(int code) {
  //   if (code == 401) {
  //     return NetworkFailure(error: 'Unauthorized');
  //   }
  //   return null;
  // }

  NetworkFailure? _handleError(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return null;
      case 201:
        return null;
      case 400:
        return NetworkFailure(
          error: jsonDecode(response.body)["message"] ?? 'BadRequestException',
        );

      case 401:
        return NetworkFailure(
            error: jsonDecode(response.body)["message"] ??
                'UnauthorisedException');
      case 404:
        return NetworkFailure(
            error: jsonDecode(response.body)["message"] ?? 'Not Found');
      case 500:
        return NetworkFailure(
            error: jsonDecode(response.body)["message"] ?? 'Server Error');
      default:
        return NetworkFailure(
            error: jsonDecode(response.body)["message"] ?? 'Server Error');
    }
  }
}
