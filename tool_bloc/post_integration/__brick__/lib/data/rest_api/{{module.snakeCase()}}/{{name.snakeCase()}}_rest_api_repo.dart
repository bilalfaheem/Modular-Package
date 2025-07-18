import 'package:fpdart/fpdart.dart';
import 'package:service/data/header.dart/header.dart';
import 'package:service/data/model/{{name.snakeCase()}}_data_model/{{name.snakeCase()}}_data_model.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/repository/{{module.snakeCase()}}/{{name.snakeCase()}}_repo.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/data/model/base_json.dart';
import 'package:service/domain/entities/{{module.snakeCase()}}/{{name.snakeCase()}}_entity.dart';


class {{name.pascalCase()}}RestApiRepo implements {{name.pascalCase()}}Repo {
  final Network network;
  final AppUrl appUrl;
  @override
  {{name.pascalCase()}}RestApiRepo(this.network,this.appUrl);
  Future<Either<RepoFailure, BaseEntity>> {{name.camelCase()}}({{name.pascalCase()}}Entity data) =>
      network
            .post(
            appUrl.{{name.camelCase()}}Url,
            data.toJson().$2,
            Header.bearerHeaderWithApplicationJson(
                data.toJson().$1),
          )
          .then((value) =>
              value.fold((l) => left(RepoFailure(error: l.error)), (response) {
                 try {
                  return  right(BaseJson.fromJson(response, (_) => null).toDomain((data) => null));
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              }));
}
