import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/auth/forgot_password_entity.dart';
import 'package:service/domain/failures/validation_failure.dart';
import 'package:service/domain/validator/validator.dart';

class ForgotPasswordValidator {
  Either<ValidationFailure, ForgotPasswordEntity> validate(
      ForgotPasswordEntity data) {
    if (Validator.validateEmail(data.email) != null) {
      return left(
          ValidationFailure(error: Validator.validateEmail(data.email)!));
    } else {
      return right(data);
    }
  }
}
