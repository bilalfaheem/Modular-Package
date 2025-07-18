import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/auth/signup_entity.dart';
import 'package:service/domain/failures/validation_failure.dart';
import 'package:service/domain/validator/validator.dart';

class SignupValidator {
  Either<ValidationFailure, SignupEntity> validate(SignupEntity data) {
    if (Validator.validate(data.name, 'name') != null) {
      return left(
          ValidationFailure(error: Validator.validate(data.name, 'name')!));
    } else if (Validator.validatePhone(data.phoneNo, "phone") != null) {
      return left(ValidationFailure(
          error: Validator.validatePhone(data.phoneNo, "phone")!));
    } else if (Validator.validateEmail(data.email) != null) {
      return left(
          ValidationFailure(error: Validator.validateEmail(data.email)!));
    }
    if (Validator.validatePassword(data.password) != null) {
      return left(
          ValidationFailure(error: Validator.validatePassword(data.password)!));
    } else {
      return right(data);
    }
  }
}
