import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/communication/chat_entity.dart';
import 'package:service/domain/entities/communication/get_chat_entity.dart';
import 'package:service/domain/entities/communication/listen_chat_entity.dart';
import 'package:service/domain/entities/communication/message_entity.dart';
import 'package:service/domain/entities/communication/send_message_entity.dart';
import 'package:service/domain/failures/communication/chat_failure.dart';
import 'package:service/domain/repository/communication/chat_repo.dart';
import 'package:service/domain/validator/communication/chat_validator.dart';
import 'package:signalr_netcore/hub_connection.dart';

class ChatUseCase {
  final ChatRepo _repo;
  final ChatValidator _validator;
  ChatUseCase(this._repo, this._validator);

  Future<Either<ChatFailure, BaseEntity>> executeCreateChat(
          ChatEntity data) async =>
      _validator.validate(data).fold(
          (err) => left(ChatFailure(error: err.error)),
          (res) async => await _repo.createChat(res).then((value) => value.fold(
              (err) => left(ChatFailure(error: err.error)),
              (response) => right(response))));

  Future<Either<ChatFailure, BaseEntity<List<MessageEntity>>>> executeGetChat(
          GetChatEntity data) async =>
      await _repo.getChat(data).then((value) => value.fold(
          (err) => left(ChatFailure(error: err.error)),
          (response) => right(response)));
  Future<Either<ChatFailure, HubConnection>> joinChat(
          GetChatEntity data) async =>
      await _repo.joinChat(data).then((value) => value.fold(
          (err) => left(ChatFailure(error: err.error)),
          (response) => right(response)));
  Stream<Either<ChatFailure, MessageEntity>> listenChat(ListenChatEntity data) {
    return _repo.listenChat(data).map((event) => event.fold(
        (err) => left(ChatFailure(error: err.error)),
        (response) => right(response)));
  }

  Future<Either<ChatFailure, bool>> sendMessage(SendMessageEntity data) async =>
      await _repo.sendMessage(data).then((value) => value.fold(
          (err) => left(ChatFailure(error: err.error)),
          (response) => right(response)));
}
