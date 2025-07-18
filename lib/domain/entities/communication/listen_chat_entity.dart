import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:signalr_netcore/hub_connection.dart';
import 'package:service/domain/failures/network_failure.dart';

class ListenChatEntity {
  final HubConnection hubConnection;
  final StreamController<Either<NetworkFailure, dynamic>> controller;
  ListenChatEntity(this.hubConnection, this.controller);
}
