import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:logging/logging.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:signalr_netcore/ihub_protocol.dart';
import '../../domain/failures/network_failure.dart';

abstract class Network {
  Future<Either<NetworkFailure, dynamic>> get(
      String url, Map<String, String>? header,
      {Map<String, dynamic>? query, String? pathVariable});
  Future<Either<NetworkFailure, dynamic>> post(
      String url, Map<String, dynamic> data, Map<String, String>? header,
      {String? pathVariable});
  Future<Either<NetworkFailure, dynamic>> patch(
      String url, Map<String, dynamic> data, Map<String, String>? header,
      {String? pathVariable});
  Future<Either<NetworkFailure, dynamic>> put(
      String url, Map<String, dynamic> data, Map<String, String>? header,
      {String? pathVariable});
  Future<Either<NetworkFailure, dynamic>> postFile(
      String url,
      Map<String, dynamic> data,
      Map<String, dynamic> file,
      Map<String, String>? header,
      {String? pathVariable});
  Future<Either<NetworkFailure, dynamic>> patchFile(
      String url,
      Map<String, dynamic> data,
      Map<String, dynamic> file,
      Map<String, String>? header,
      {String? pathVariable});
  Future<Either<NetworkFailure, dynamic>> putFile(
      String url,
      Map<String, dynamic> data,
      Map<String, dynamic> file,
      Map<String, String>? header,
      {String? pathVariable});
  Future<Either<NetworkFailure, HubConnection>> startConnection({
    required HubConnection? hubConnection,
    required String serverUrl,
    required String accessToken,
    MessageHeaders? header,
    String? eventName,
    List<Object>? args,
    Logger? logger,
  });
  Future<Either<NetworkFailure, dynamic>> stopConnection(
      {required HubConnection? hubConnection,
      required String event,
      List<Object>? args});
  Future<Either<NetworkFailure, dynamic>> onReceiveData(
      {required HubConnection? hubConnection,
      required String event,
      void Function(Object?)? onReceive});
  Stream<Either<NetworkFailure, dynamic>> listen(
      {required HubConnection? hubConnection,
      required String event,
      required StreamController<Either<NetworkFailure, dynamic>>
          streamController});

  Future<Either<NetworkFailure, dynamic>> emit(
      {required HubConnection? hubConnection,
      required String event,
      List<Object>? args});
}
