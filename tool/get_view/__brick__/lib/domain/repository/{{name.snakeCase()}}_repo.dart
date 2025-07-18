import 'package:fpdart/fpdart.dart';
import 'package:service/data/model/{{name.snakeCase()}}_data_model/{{name.snakeCase()}}_data_model.dart';
import 'package:service/data/network/network.dart';
import 'package:service/domain/failures/repo_failure.dart';

abstract class {{name.pascalCase()}}Repo {
  final Network network;
  {{name.pascalCase()}}Repo(this.network);
  Future<Either<RepoFailure, {{name.pascalCase()}}DataModel>> {{name.camelCase()}}();
}
