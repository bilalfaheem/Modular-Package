import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/auth/edit_profile_entity.dart';
import 'package:service/domain/entities/auth/update_profile_picture_entity.dart';
import 'package:service/domain/failures/validation_failure.dart';
import 'package:service/domain/validator/validator.dart';

class EditProfileValidator {
  Either<ValidationFailure, EditProfileEntity> validate(
      EditProfileEntity data) {
    if (Validator.validate(data.name, "Name") != null) {
      return left(
          ValidationFailure(error: Validator.validate(data.name, "Name")!));
    }
    if (Validator.validatePhone(data.phone, "Phone") != null) {
      return left(ValidationFailure(
          error: Validator.validatePhone(data.phone, "Phone")!));
    } else {
      return right(data);
    }
  }

  Either<ValidationFailure, UpdateProfilePictureEntity>
      validateUpdateProfilePicture(UpdateProfilePictureEntity data) {
    if (Validator.validateImage(data.image, "Profile picture") != null) {
      return left(ValidationFailure(
          error: Validator.validateImage(data.image, "Image")!));
    } else {
      return right(data);
    }
  }
}
