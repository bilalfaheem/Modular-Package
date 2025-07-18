import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/auth/login_entity.dart';
import 'package:service/domain/failures/validation_failure.dart';
import 'package:service/domain/validator/validator.dart';

class LoginValidator {
  Either<ValidationFailure, LoginEntity> validate(LoginEntity data) {
    if (Validator.validate(data.userName, "Username/Email") != null) {
      return left(ValidationFailure(
          error: Validator.validate(data.userName, "Username/Email")!));
    } else if (Validator.validatePassword(data.password) != null) {
      return left(
          ValidationFailure(error: Validator.validatePassword(data.password)!));
    } else {
      return right(data);
    }
  }
}
