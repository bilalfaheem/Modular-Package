import 'package:fpdart/fpdart.dart';
import 'package:service/data/header.dart/header.dart';
import 'package:service/data/model/base_json.dart';
import 'package:service/data/model/user_token_json.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/auth/login_entity.dart';
import 'package:service/domain/entities/user_token_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/repository/auth/login_repo.dart';

class LoginRestApiRepo implements LoginRepo {
  final Network network;
  final AppUrl appUrl;
  LoginRestApiRepo(this.network, this.appUrl);
  @override
  Future<Either<RepoFailure, BaseEntity<UserTokenEntity>>> login(
          LoginEntity data) =>
      network
          .post(
            appUrl.loginUrl,
            data.toJson(),
            Header.contentTypeText(),
          )
          .then((value) =>
              value.fold((l) => left(RepoFailure(error: l.error)), (response) {
                try {
                  return right(BaseJson<UserTokenJson>.fromJson(
                    response,
                    UserTokenJson.fromJson(response['data']),
                  ).toDomain((userTokenJson) => userTokenJson!.toDomain()));
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              }));
}
