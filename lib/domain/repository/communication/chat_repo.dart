import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/communication/get_chat_entity.dart';
import 'package:service/domain/entities/communication/listen_chat_entity.dart';
import 'package:service/domain/entities/communication/message_entity.dart';
import 'package:service/domain/entities/communication/send_message_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/communication/chat_entity.dart';
import 'package:signalr_netcore/hub_connection.dart';

abstract class ChatRepo {
  final Network network;
  final AppUrl appUrl;

  ChatRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity>> createChat(ChatEntity data);
  Future<Either<RepoFailure, BaseEntity<List<MessageEntity>>>> getChat(
      GetChatEntity data);
  Future<Either<RepoFailure, HubConnection>> joinChat(GetChatEntity data);
  Stream<Either<RepoFailure, MessageEntity>> listenChat(ListenChatEntity data);
  Future<Either<RepoFailure, bool>> sendMessage(SendMessageEntity data);
}
