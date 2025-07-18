import 'package:fpdart/fpdart.dart';

import '../../domain/failures/network_failure.dart';

abstract class Network {
  Future<Either<NetworkFailure, dynamic>> get(String url, Map<String, String>? header, {Map<String, dynamic>? query, String? pathVariable});
  Future<Either<NetworkFailure, dynamic>> post(String url, Map<String, dynamic> data, Map<String, String>? header, {String? pathVariable});
  Future<Either<NetworkFailure, dynamic>> patch(String url, Map<String, dynamic> data, Map<String, String>? header, {String? pathVariable});
  Future<Either<NetworkFailure, dynamic>> postFile(String url, Map<String, dynamic> data, Map<String, dynamic> file, Map<String, String>? header);
}
