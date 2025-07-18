import 'package:fpdart/fpdart.dart';

import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/auth/change_password_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';

abstract class ChangePasswordRepo {
  final Network network;
  final AppUrl appUrl;

  ChangePasswordRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity>> changePassword(
      ChangePasswordEntity data);
}
