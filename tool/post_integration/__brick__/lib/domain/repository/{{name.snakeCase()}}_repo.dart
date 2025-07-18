import 'package:fpdart/fpdart.dart';
import 'package:service/data/header.dart/header.dart';
import 'package:service/data/model/{{name.snakeCase()}}_data_model/{{name.snakeCase()}}_data_model.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/store/user_store.dart';

abstract class {{name.pascalCase()}}Repo {
  final Network network;
  {{name.pascalCase()}}Repo(this.network);
  Future<Either<RepoFailure, {{name.pascalCase()}}DataModel>> {{name.camelCase()}}(Map<String, dynamic> data){}
}
