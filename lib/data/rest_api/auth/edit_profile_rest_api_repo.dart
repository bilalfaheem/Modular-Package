import 'package:fpdart/fpdart.dart';
import 'package:service/data/header.dart/header.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/auth/edit_profile_entity.dart';
import 'package:service/domain/entities/auth/update_profile_picture_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/store/user_store.dart';
import 'package:service/domain/repository/auth/edit_profile_repo.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/data/model/base_json.dart';

class EditProfileRestApiRepo implements EditProfileRepo {
  final Network network;
  final AppUrl appUrl;
  EditProfileRestApiRepo(this.network, this.appUrl);
  @override
  Future<Either<RepoFailure, BaseEntity>> editProfile(EditProfileEntity data) =>
      network
          .post(
            appUrl.editProfileUrl,
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
  @override
  Future<Either<RepoFailure, BaseEntity>> updateProfilePicture(
          UpdateProfilePictureEntity data) =>
      network
          .putFile(
            appUrl.updateProfilePictureUrl,
            {},
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
