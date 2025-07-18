import 'package:fpdart/fpdart.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/{{module.snakeCase()}}/{{name.snakeCase()}}_entity.dart';

abstract class {{name.pascalCase()}}Repo {
  final Network network;
  final AppUrl appUrl;

  {{name.pascalCase()}}Repo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity>> {{name.camelCase()}}({{name.pascalCase()}}Entity data);
}
