import 'package:fpdart/fpdart.dart';
import 'package:service/data/header.dart/header.dart';
import 'package:service/data/model/base_json.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/wage/update_wage_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/repository/wage/update_wage_repo.dart';

class UpdateWageRestApiRepo implements UpdateWageRepo {
  final Network network;
  final AppUrl appUrl;
  UpdateWageRestApiRepo(this.network, this.appUrl);
  @override
  Future<Either<RepoFailure, BaseEntity>> updateWage(UpdateWageEntity data) =>
      network
          .patch(appUrl.updateWageUrl, data.toJson().$2,
              Header.bearerHeaderWithApplicationJson(data.toJson().$1),
              pathVariable: "${data.toJson().$3}/Status")
          .then((value) =>
              value.fold((l) => left(RepoFailure(error: l.error)), (response) {
                try {
                  return right(BaseJson.fromJson(response, (_) => null)
                      .toDomain((data) => null));
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              }));
}
