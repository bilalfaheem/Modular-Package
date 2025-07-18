import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/auth/change_password_entity.dart';
import 'package:service/domain/failures/validation_failure.dart';
import 'package:service/domain/validator/validator.dart';

class ChangePasswordValidator {
  Either<ValidationFailure, ChangePasswordEntity> validate(
      ChangePasswordEntity data) {
    if (Validator.validatePasswordType(data.currentPassword, "Current") !=
        null) {
      return left(ValidationFailure(
          error: Validator.validatePasswordType(
              data.currentPassword, "Current")!));
    } else if (Validator.validatePasswordType(data.currentPassword, "New") !=
        null) {
      return left(ValidationFailure(
          error: Validator.validatePasswordType(data.currentPassword, "New")!));
    } else if (data.currentPassword != data.newPassword) {
      return left(ValidationFailure(
          error: "Current password and new password should be different"));
    } else if (data.newPassword != data.confirmPassword) {
      return left(ValidationFailure(
          error: "New password and confirm password should be same"));
    } else {
      return right(data);
    }
  }
}
