import 'package:fpdart/fpdart.dart';
import 'package:service/data/header.dart/header.dart';
import 'package:service/data/model/base_json.dart';
import 'package:service/data/model/form_data_model/form_data_model.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/auth/forms_entity.dart';
import 'package:service/domain/entities/auth/roles_entity.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/repository/auth/complete_profile_repo.dart';
import 'package:service/domain/store/user_store.dart';

class CompleteProfileRestApiRepo implements CompleteProfileRepo {
  final Network network;
  final AppUrl appUrl;
  CompleteProfileRestApiRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity<List<String>>>> roles(
          RolesEntity data) =>
      network
          .get(
            appUrl.completeProfileUrl,
            query: data.toJson(),
            Header.bearerHeaderWithApplicationJson(UserStore.JWT.toString()),
          )
          .then((value) =>
              value.fold((l) => left(RepoFailure(error: l.error)), (response) {
                try {
                  return right(BaseJson<FormDataModel>.fromJson(
                          response, FormDataModel.fromJson(response['data']))
                      .toDomain((data) => data?.toDomain() ?? []));
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              }));

  Future<Either<RepoFailure, BaseEntity>> forms(FormsEntity data) => network
      .get(
        appUrl.formsUrl,
        query: data.toJson(),
        Header.bearerHeaderWithApplicationJson(UserStore.JWT.toString()),
      )
      .then((value) =>
          value.fold((l) => left(RepoFailure(error: l.error)), (response) {
            try {
              return right(BaseJson<FormDataModel>.fromJson(
                      response, FormDataModel.fromJson(response['data']))
                  .toDomain((data) => data?.toDomain() ?? []));
            } catch (e) {
              return left(RepoFailure(error: e.toString()));
            }
          }));
}
