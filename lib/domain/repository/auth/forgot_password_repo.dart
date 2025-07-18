import 'package:fpdart/fpdart.dart';

import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/auth/forgot_password_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';

abstract class ForgotPasswordRepo {
  final Network network;
  final AppUrl appUrl;
  ForgotPasswordRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity>> forgotPassword(
      ForgotPasswordEntity data);
}
