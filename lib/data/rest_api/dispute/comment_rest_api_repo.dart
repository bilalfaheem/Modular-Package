import 'package:fpdart/fpdart.dart';
import 'package:service/data/header.dart/header.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/repository/dispute/comment_repo.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/data/model/base_json.dart';
import 'package:service/domain/entities/dispute/comment_entity.dart';
import 'package:service/utils/utils.dart';
import 'package:signalr_netcore/hub_connection.dart';

class CommentRestApiRepo implements CommentRepo {
  final Network network;
  final AppUrl appUrl;
  @override
  CommentRestApiRepo(this.network, this.appUrl);

  HubConnection? hubConnection;
  @override
  Future<Either<RepoFailure, BaseEntity>> addComment(CommentEntity data) =>
      network
          .putFile(
            appUrl.commentUrl,
            data.toJson().$2,
            {},
            Header.bearerHeaderOnly(data.toJson().$1),
            pathVariable: "${data.ticketId}/Comment",
          )
          .then((value) =>
              value.fold((l) => left(RepoFailure(error: l.error)), (response) {
                try {
                  return right(BaseJson.fromJson(response, (_) => null)
                      .toDomain((data) => data));
                } catch (e) {
                  Utils.logInfo(e.toString(), name: "CommentRestApiRepo");
                  return left(RepoFailure(error: e.toString()));
                }
              }));

  @override
  Future<Either<RepoFailure, BaseEntity>> startConnection(
      CommentEntity data) async {
    return await network.startConnection(
        hubConnection: hubConnection,
        serverUrl: appUrl.commentServerUrl,
        eventName: "JoinGroup",
        accessToken: data.token,
        logger: data.logger,
        args: [data.ticketId]).then(
      (value) => value.fold(
        (l) => left(RepoFailure(error: l.error)),
        (response) {
          try {
            if (response is HubConnection) hubConnection = response;
            return right(
                BaseJson.fromJson({}, (_) => null).toDomain((data) => data));
          } catch (e) {
            return left(RepoFailure(error: e.toString()));
          }
        },
      ),
    );
  }

  @override
  Future<Either<RepoFailure, BaseEntity>> receiveComment(
      void Function(Object?)? onReceive) {
    return network
        .onReceiveData(
            hubConnection: hubConnection,
            event: "addTicket",
            onReceive: onReceive)
        .then(
          (value) => value.fold(
            (l) => left(RepoFailure(error: l.error)),
            (response) {
              try {
                return right(BaseJson.fromJson(response, (_) => null)
                    .toDomain((data) => data));
              } catch (e) {
                return left(RepoFailure(error: e.toString()));
              }
            },
          ),
        );
  }

  @override
  Future<Either<RepoFailure, BaseEntity>> stopConnection(CommentEntity data) {
    return network.stopConnection(
        hubConnection: hubConnection,
        event: "LeaveGroup",
        args: [data.ticketId]).then(
      (value) => value.fold(
        (l) => left(RepoFailure(error: l.error)),
        (response) {
          try {
            return right(BaseJson.fromJson(response, (_) => null)
                .toDomain((data) => data));
          } catch (e) {
            return left(RepoFailure(error: e.toString()));
          }
        },
      ),
    );
  }
}
