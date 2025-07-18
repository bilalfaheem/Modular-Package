import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/auth/roles_entity.dart';
import 'package:service/domain/failures/validation_failure.dart';

class CompleteProfileValidator {
  Either<ValidationFailure, RolesEntity> validate(RolesEntity data) {
    return right(data);
  }
}
