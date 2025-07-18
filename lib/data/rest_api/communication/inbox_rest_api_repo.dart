import 'package:fpdart/fpdart.dart';
import 'package:service/data/header.dart/header.dart';
import 'package:service/data/model/communication/inbox_json/inbox_json.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/communication/inbox_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/repository/communication/inbox_repo.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/data/model/base_json.dart';
import 'package:service/domain/entities/communication/get_inbox_entity.dart';

class InboxRestApiRepo implements InboxRepo {
  final Network network;
  final AppUrl appUrl;
  InboxRestApiRepo(this.network, this.appUrl);
  @override
  Future<Either<RepoFailure, BaseEntity<List<InboxEntity>>>> inbox(
          GetInboxEntity data) =>
      network
          .get(
            appUrl.inboxUrl,
            query: data.toJson().$2,
            Header.bearerHeaderWithApplicationJson(data.toJson().$1),
          )
          .then((value) =>
              value.fold((l) => left(RepoFailure(error: l.error)), (response) {
                try {
                  return right(BaseJson<List<InboxJson>>.fromJson(
                          response,
                          (response['data'] as List<dynamic>)
                              .map((e) =>
                                  InboxJson.fromJson(e as Map<String, dynamic>))
                              .toList())
                      .toDomain((data) =>
                          data?.map((e) => e.toDomain()).toList() ?? []));
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              }));
}
