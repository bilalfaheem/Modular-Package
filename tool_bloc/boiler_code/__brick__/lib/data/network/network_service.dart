import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/src/media_type.dart';

import '../../domain/failures/network_failure.dart';
import '../../utils/utils.dart';
import 'network.dart';

class NetworkService extends Network {
  // get put post delete
  // Take a URL string as parameter
  // and return Map<String, dynamic> as json
  // And do exception handling
  @override
  Future<Either<NetworkFailure, dynamic>> get(url, header, {Map<String, dynamic>? query, String? pathVariable}) async {
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
      return left(NetworkFailure(ex.toString()));
    }
  }

  @override
  Future<Either<NetworkFailure, dynamic>> post(String url, Map<String, dynamic> data, header, {String? pathVariable}) async {
    try {
      var uri;
      if (pathVariable == null) {
        uri = Uri.parse(url);
      } else {
        uri = Uri.parse(url + "/" + pathVariable);
      }
      Utils.logInfo(url.toString(), name: "Post Url");
      Utils.logInfo(header.toString(), name: "Post Headers");
      Utils.logInfo(data.toString(), name: "Post Data");
      var response = await http.post(uri, body: jsonEncode(data), headers: header);
      final failure = _handleError(response);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(NetworkFailure(ex.toString()));
    }
  }

  @override
  Future<Either<NetworkFailure, dynamic>> patch(String url, Map<String, dynamic> data, header, {String? pathVariable}) async {
    try {
      var uri;
      if (pathVariable == null) {
        uri = Uri.parse(url);
      } else {
        uri = Uri.parse(url + "/" + pathVariable);
      }
      Utils.logInfo(url.toString(), name: "Patch Url");
      Utils.logInfo(uri.toString(), name: "Patch Uri");
      Utils.logInfo(header.toString(), name: "Patch Headers");
      Utils.logInfo(data.toString(), name: "Patch Data");
      var response = await http.patch(uri, body: jsonEncode(data), headers: header);
      final failure = _handleError(response);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(NetworkFailure(ex.toString()));
    }
  }

  @override
  Future<Either<NetworkFailure, dynamic>> put(String url, Map<String, dynamic> data, header, {String? pathVariable}) async {
    try {
      var uri;
      if (pathVariable == null) {
        uri = Uri.parse(url);
      } else {
        uri = Uri.parse(url + "/" + pathVariable);
      }
      Utils.logInfo(url.toString(), name: "Put Url");
      Utils.logInfo(uri.toString(), name: "Put Uri");
      Utils.logInfo(header.toString(), name: "Put Headers");
      Utils.logInfo(data.toString(), name: "Put Data");
      var response = await http.put(uri, body: jsonEncode(data), headers: header);
      final failure = _handleError(response);
      if (failure != null) {
        return left(failure);
      }
      return right(jsonDecode(response.body));
    } catch (ex) {
      return left(NetworkFailure(ex.toString()));
    }
  }

  @override
  Future<Either<NetworkFailure, dynamic>> postFile(String url, Map<String, dynamic> data, Map<String, dynamic> file, header,
      {String? pathVariable}) async {
    try {
      var uri;
      if (pathVariable == null) {
        uri = Uri.parse(url);
      } else {
        uri = Uri.parse(url + "/" + pathVariable);
      }
      Utils.logInfo(header.toString(), name: "Post Headers");
      Utils.logInfo(url.toString(), name: "Post URL");
      Utils.logInfo(uri.toString(), name: "Post URI");
      Utils.logInfo(data.toString(), name: "Post Data");
      Utils.logInfo(file.toString(), name: "Post Files");

      final request = http.MultipartRequest('POST', Uri.parse(uri));
      request.headers.addAll(header!);
      data.forEach((key, value) {
        if (value is List) {
          request.fields[key] = jsonEncode(value); // Encode the list to a JSON string
        } else {
          request.fields[key] = value; // Convert the value to a string if it's not a list
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
                final filePart = await http.MultipartFile.fromPath(key, filePath, filename: fileName, contentType: contentType);
                request.files.add(filePart);
              }
            } else {
              final key = entry.key;
              final filePath = entry.value;
              final fileName = entry.value.split('/').last;
              final contentType = MediaType("image", "${entry.value.split('.').last}");
              final filePart = await http.MultipartFile.fromPath(key, filePath, filename: fileName, contentType: contentType);
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
      return left(NetworkFailure(ex.toString()));
    }
  }

  @override
  Future<Either<NetworkFailure, dynamic>> patchFile(String url, Map<String, dynamic> data, Map<String, dynamic> file, header,
      {String? pathVariable}) async {
    try {
      var uri;
      if (pathVariable == null) {
        uri = Uri.parse(url);
      } else {
        uri = Uri.parse(url + "/" + pathVariable);
      }
      Utils.logInfo(header.toString(), name: "PATCH Headers");
      Utils.logInfo(url.toString(), name: "PATCH URL");
      Utils.logInfo(uri.toString(), name: "PATCH URI");
      Utils.logInfo(data.toString(), name: "PATCH Data");
      Utils.logInfo(file.toString(), name: "PATCH Files");

      final request = http.MultipartRequest('PATCH', Uri.parse(uri));
      request.headers.addAll(header!);
      data.forEach((key, value) {
        if (value is List) {
          request.fields[key] = jsonEncode(value); // Encode the list to a JSON string
        } else {
          request.fields[key] = value; // Convert the value to a string if it's not a list
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
                final filePart = await http.MultipartFile.fromPath(key, filePath, filename: fileName, contentType: contentType);
                request.files.add(filePart);
              }
            } else {
              final key = entry.key;
              final filePath = entry.value;
              final fileName = entry.value.split('/').last;
              final contentType = MediaType("image", "${entry.value.split('.').last}");
              final filePart = await http.MultipartFile.fromPath(key, filePath, filename: fileName, contentType: contentType);
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
      return left(NetworkFailure(ex.toString()));
    }
  }

  @override
  Future<Either<NetworkFailure, dynamic>> putFile(String url, Map<String, dynamic> data, Map<String, dynamic> file, header,
      {String? pathVariable}) async {
    try {
      var uri;
      if (pathVariable == null) {
        uri = Uri.parse(url);
      } else {
        uri = Uri.parse(url + "/" + pathVariable);
      }
      Utils.logInfo(header.toString(), name: "Put Headers");
      Utils.logInfo(url.toString(), name: "Put URL");
      Utils.logInfo(uri.toString(), name: "Put URI");
      Utils.logInfo(data.toString(), name: "Put Data");
      Utils.logInfo(file.toString(), name: "Put Files");

      final request = http.MultipartRequest('PUT', Uri.parse(uri));
      request.headers.addAll(header!);
      data.forEach((key, value) {
        if (value is List) {
          request.fields[key] = jsonEncode(value); // Encode the list to a JSON string
        } else {
          request.fields[key] = value; // Convert the value to a string if it's not a list
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
                final filePart = await http.MultipartFile.fromPath(key, filePath, filename: fileName, contentType: contentType);
                request.files.add(filePart);
              }
            } else {
              final key = entry.key;
              final filePath = entry.value;
              final fileName = entry.value.split('/').last;
              final contentType = MediaType("image", "${entry.value.split('.').last}");
              final filePart = await http.MultipartFile.fromPath(key, filePath, filename: fileName, contentType: contentType);
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
      return left(NetworkFailure(ex.toString()));
    }
  }

  NetworkFailure? _handleError(http.Response response) {
    final statusCode = response.statusCode;
    final responseBody = response.body.isNotEmpty ? jsonDecode(response.body) : {};

    String? getMessage() {
      return (responseBody is Map && responseBody.containsKey("userMessage")) ? responseBody["userMessage"] : null;
    }

    switch (statusCode) {
      case 200:
      case 201:
      case 202:
        return null;
      case 400:
        return BadRequestFailure(getMessage());
      case 401:
        return UnAuthorizedFailure(getMessage());
      case 403:
        return Forbidden(getMessage());
      case 404:
        return NotFoundFailure(getMessage());
      case 405:
        return MethodNotAllowed(getMessage());
      case 408:
        return RequestTimeoutFailure(getMessage());

      case 413:
        return PayloadTooLarge(getMessage());
      case 415:
        return UnsupportedMediaType(getMessage());
      case 422:
        return UnprocessableEntity(getMessage());
      case 500:
        return ServerFailure(getMessage());
      case 502:
        return BadGateway(getMessage());
      case 504:
        return RequestTimeoutFailure(getMessage());
      default:
        return NetworkFailure(getMessage() ?? "Something went wrong");
    }
  }
}
