import 'package:fpdart/fpdart.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/auth/forms_entity.dart';
import 'package:service/domain/entities/auth/roles_entity.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';

abstract class CompleteProfileRepo {
  final Network network;
  final AppUrl appUrl;

  CompleteProfileRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity<List<String>>>> roles(RolesEntity data);
  Future<Either<RepoFailure, BaseEntity>> forms(FormsEntity data);
}
