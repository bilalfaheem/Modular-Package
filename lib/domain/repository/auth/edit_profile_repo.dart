import 'package:fpdart/fpdart.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/auth/edit_profile_entity.dart';
import 'package:service/domain/entities/auth/update_profile_picture_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/entities/base_entity.dart';

abstract class EditProfileRepo {
  final Network network;
  final AppUrl appUrl;

  EditProfileRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity>> editProfile(EditProfileEntity data);

  Future<Either<RepoFailure, BaseEntity>> updateProfilePicture(
      UpdateProfilePictureEntity data);
}
