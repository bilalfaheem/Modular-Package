import 'package:fpdart/fpdart.dart';
import 'package:service/data/header.dart/header.dart';
import 'package:service/data/model/{{name.snakeCase()}}_data_model/{{name.snakeCase()}}_data_model.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/store/user_store.dart';
 import 'package:service/domain/repository/{{module.snakeCase()}}/{{name.snakeCase()}}_repo.dart';


class {{name.pascalCase()}}RestApiRepo implements {{name.pascalCase()}}Repo {
  final Network network;
  {{name.pascalCase()}}RestApiRepo(this.network);
  Future<Either<RepoFailure, {{name.pascalCase()}}DataModel>> {{name.camelCase()}}() =>
      network
          .get(
            AppUrls.{{name.camelCase()}}Url,
            Header.bearerHeaderWithApplicationJson(
                UserStore.JWT.toString()),
          )
          .then((value) =>
              value.fold((l) => left(RepoFailure(error: l.error)), (response) {
                 try {
                  return  right({{name.pascalCase()}}DataModel.fromJson(response));
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              }));
}
