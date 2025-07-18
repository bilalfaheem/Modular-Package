import 'package:fpdart/fpdart.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/auth/signup_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/entities/base_entity.dart';

abstract class SignupRepo {
  final Network network;
  final AppUrl appUrl;

  SignupRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity>> signup(SignupEntity data);
}
