import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/data/model/{{name.snakeCase()}}_data_model/{{name.snakeCase()}}_data_model.dart';
 import 'package:service/domain/repository/{{module.snakeCase()}}/{{name.snakeCase()}}_repo.dart';
import 'package:service/domain/entities/{{module.snakeCase()}}/{{name.snakeCase()}}_entity.dart';
import 'package:service/domain/failures/{{module.snakeCase()}}/{{name.snakeCase()}}_failure.dart';

class {{name.pascalCase()}}UseCase {
  final {{name.pascalCase()}}Repo _repo;
  {{name.pascalCase()}}UseCase(this._repo);

  Future<Either<{{name.pascalCase()}}Failure, BaseEntity>> execute({{name.pascalCase()}}Entity data)  async => await _repo.{{name.camelCase()}}(data).then((value) => value.fold(
              (err) => left({{name.pascalCase()}}Failure(error: err.error)),
              (response) => right(response)));
}
