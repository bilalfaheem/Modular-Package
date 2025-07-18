import 'package:fpdart/fpdart.dart';
import 'package:service/data/model/{{name.snakeCase()}}_data_model/{{name.snakeCase()}}_data_model.dart';
import 'package:service/data/repository/{{name.snakeCase()}}_repo.dart';
import 'package:service/domain/entities/{{module.snakeCase()}}/{{name.snakeCase()}}_entity.dart';
import 'package:service/domain/failures/{{module.snakeCase()}}/{{name.snakeCase()}}_failure.dart';
import 'package:service/domain/validator/{{module.snakeCase()}}/{{name.snakeCase()}}_validator.dart';

class {{name.pascalCase()}}UseCase {
  final {{name.pascalCase()}}Repo _repo;
  final {{name.pascalCase()}}Validator _validator;
  {{name.pascalCase()}}UseCase(this._repo, this._validator);

  Future<Either<{{name.pascalCase()}}Failure, {{name.pascalCase()}}DataModel>> execute({{name.pascalCase()}}Entity data) async =>
      _validator.validate(data).fold(
          (err) => left({{name.pascalCase()}}Failure(error: err.error)),
          (data) async => await _repo.{{name.camelCase()}}(data).then((value) => value.fold(
              (err) => left({{name.pascalCase()}}Failure(error: err.error)),
              (response) => right(response))));
}
