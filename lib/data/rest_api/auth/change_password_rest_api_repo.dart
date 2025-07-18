import 'package:fpdart/fpdart.dart';
import 'package:service/data/header.dart/header.dart';
import 'package:service/data/model/base_json.dart';

import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/auth/change_password_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/store/user_store.dart';
import 'package:service/domain/repository/auth/change_password_repo.dart';

class ChangePasswordRestApiRepo implements ChangePasswordRepo {
  final Network network;
  final AppUrl appUrl;
  ChangePasswordRestApiRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity>> changePassword(
          ChangePasswordEntity data) =>
      network
          .post(
            appUrl.changePasswordUrl,
            data.toJson(),
            Header.bearerHeaderWithApplicationJson(UserStore.JWT.toString()),
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
}
