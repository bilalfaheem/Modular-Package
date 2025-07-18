import 'package:fpdart/fpdart.dart';
import 'package:service/data/header.dart/header.dart';
import 'package:service/data/model/base_json.dart';
import 'package:service/data/model/wage/wage_json/wage_json.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/wage/wage_entity.dart';
import 'package:service/domain/entities/wage/wages_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/repository/wage/wages_repo.dart';

class WagesRestApiRepo implements WagesRepo {
  final Network network;
  final AppUrl appUrl;
  WagesRestApiRepo(this.network, this.appUrl);
  @override
  Future<Either<RepoFailure, BaseEntity<List<WageEntity>>>> wages(WagesEntity data) => network
      .get(
        appUrl.wagesUrl,
        query: data.toJson().$2,
        Header.bearerHeaderWithApplicationJson(data.toJson().$1),
      )
      .then((value) => value.fold((l) => left(RepoFailure(error: l.error)), (response) {
            try {
              return right(BaseJson<List<WageJson>>.fromJson(
                      response, (response['data'] as List<dynamic>).map((e) => WageJson.fromJson(e as Map<String, dynamic>)).toList())
                  .toDomain((data) => data?.map((e) => e.toDomain()).toList() ?? []));
            } catch (e) {
              return left(RepoFailure(error: e.toString()));
            }
          }));
}
