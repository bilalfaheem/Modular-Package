import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:service/data/header.dart/header.dart';
import 'package:service/data/model/base_json.dart';
import 'package:service/data/model/communication/chat_json/message_json/message_json.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/communication/chat_entity.dart';
import 'package:service/domain/entities/communication/get_chat_entity.dart';
import 'package:service/domain/entities/communication/listen_chat_entity.dart';
import 'package:service/domain/entities/communication/message_entity.dart';
import 'package:service/domain/entities/communication/send_message_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/repository/communication/chat_repo.dart';
import 'package:signalr_netcore/hub_connection.dart';

class ChatRestApiRepo implements ChatRepo {
  final Network network;
  final AppUrl appUrl;
  ChatRestApiRepo(this.network, this.appUrl);

  @override
  Future<Either<RepoFailure, BaseEntity>> createChat(ChatEntity data) => network
      .post(
        appUrl.chatUrl,
        data.toJson().$2,
        Header.bearerHeaderWithApplicationJson(data.toJson().$1),
      )
      .then((value) =>
          value.fold((l) => left(RepoFailure(error: l.error)), (response) {
            try {
              return right(BaseJson.fromJson(response, (_) => null)
                  .toDomain((data) => null));
            } catch (e) {
              return left(RepoFailure(error: e.toString()));
            }
          }));
  @override
  Future<Either<RepoFailure, BaseEntity<List<MessageEntity>>>> getChat(
          GetChatEntity data) =>
      network
          .get(
            appUrl.chatUrl,
            Header.bearerHeaderWithApplicationJson(data.toJson().$1),
            pathVariable: '${data.toJson().$2}/Messages',
          )
          .then((value) =>
              value.fold((l) => left(RepoFailure(error: l.error)), (response) {
                try {
                  return right(BaseJson<List<MessageJson>>.fromJson(
                          response,
                          (response['data'] as List<dynamic>)
                              .map((e) => MessageJson.fromJson(
                                  e as Map<String, dynamic>))
                              .toList())
                      .toDomain((data) =>
                          data?.map((e) => e.toDomain()).toList() ?? []));
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              }));
  @override
  Future<Either<RepoFailure, HubConnection>> joinChat(
          GetChatEntity data) =>
      network
          .startConnection(
              hubConnection: data.hubConnection,
              serverUrl: appUrl.chatServerUrl,
              accessToken: data.toJson().$1,
              eventName: appUrl.chatEvent,
              args: [data.toJson().$2],
              header: Header.serverHeader())
          .then((value) =>
              value.fold((l) => left(RepoFailure(error: l.error)), (serverConnection) {
                try {
                  return right(serverConnection);
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              }));

  @override
  Stream<Either<RepoFailure, MessageEntity>> listenChat(ListenChatEntity data) {
    return network
        .listen(
      hubConnection: data.hubConnection,
      event: appUrl.listenChatEvent,
      streamController: data.controller,
    )
        .map((event) {
      return event.fold(
        (l) => left(RepoFailure(error: l.error)),
        (data) {
          try {
            final message = MessageJson.fromJson(data)
                .toDomain(); // Convert to domain entity
            return right(message);
          } catch (e) {
            return left(RepoFailure(error: e.toString()));
          }
        },
      );
    });
  }

  @override
  Future<Either<RepoFailure, bool>> sendMessage(
       SendMessageEntity data) {
    return network.emit(
      hubConnection: data.hubConnection,
      event: appUrl.listenChatEvent,
      args: [data.toJson().$2],
    ).then((value) =>
        value.fold((l) => left(RepoFailure(error: l.error)), (response) {
          try {
            return right(response);
          } catch (e) {
            return left(RepoFailure(error: e.toString()));
          }
        }));
  }
}
