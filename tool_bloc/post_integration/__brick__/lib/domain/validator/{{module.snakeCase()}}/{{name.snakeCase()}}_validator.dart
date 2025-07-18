import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/{{module.snakeCase()}}/{{name.snakeCase()}}_entity.dart';
import 'package:service/domain/failures/validation_failure.dart';
import 'package:service/domain/validator/validator.dart';

class {{name.pascalCase()}}Validator {
  Either<ValidationFailure, {{name.pascalCase()}}Entity> validate( {{name.pascalCase()}}Entity data) {
    if (Validator.validateEmail(data.email) != null) {
      return left(
          ValidationFailure(error: Validator.validateEmail(data.email)!));
    } 
     else {
      return right(data);
    }
  }
}
