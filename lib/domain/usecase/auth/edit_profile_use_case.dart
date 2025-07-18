import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/auth/edit_profile_entity.dart';
import 'package:service/domain/entities/auth/update_profile_picture_entity.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/failures/auth/edit_profile_failure.dart';
import 'package:service/domain/repository/auth/edit_profile_repo.dart';
import 'package:service/domain/validator/auth/edit_profile_validator.dart';

class EditProfileUseCase {
  final EditProfileRepo _repo;
  final EditProfileValidator _validator;
  EditProfileUseCase(this._repo, this._validator);

  Future<Either<EditProfileFailure, BaseEntity>> execute(
          EditProfileEntity data) async =>
      _validator.validate(data).fold(
          (err) => left(EditProfileFailure(error: err.error)),
          (data) async => await _repo.editProfile(data).then((value) =>
              value.fold((err) => left(EditProfileFailure(error: err.error)),
                  (response) => right(response))));

  Future<Either<EditProfileFailure, BaseEntity>> updateProfilePictureExecute(
          UpdateProfilePictureEntity data) async =>
      _validator.validateUpdateProfilePicture(data).fold(
          (err) => left(EditProfileFailure(error: err.error)),
          (res) async => await _repo.updateProfilePicture(res).then((value) =>
              value.fold((err) => left(EditProfileFailure(error: err.error)),
                  (response) => right(response))));
}
