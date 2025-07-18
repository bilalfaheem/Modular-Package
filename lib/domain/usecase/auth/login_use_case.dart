import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/auth/login_entity.dart';
import 'package:service/domain/entities/user_token_entity.dart';
import 'package:service/domain/failures/login_failure.dart';
import 'package:service/domain/repository/auth/login_repo.dart';
import 'package:service/domain/store/user_store.dart';
import 'package:service/domain/validator/auth/login_validator.dart';

class LoginUseCase {
  final LoginRepo _repo;
  final LoginValidator _validator;
  final UserStore _userStore;
  LoginUseCase(this._repo, this._validator, this._userStore);

  Future<Either<LoginFailure, BaseEntity<UserTokenEntity>>> execute(
          LoginEntity data) async =>
      _validator.validate(data).fold(
          (err) => left(LoginFailure(error: err.error)),
          (data) async => await _repo.login(data).then((value) => value.fold(
              (err) => left(LoginFailure(error: err.error)),
              (response) async => await _userStore
                  .saveUserLocally(token: response.data.accessToken.toString())
                  .then((val) => value.fold(
                      (err) => left(LoginFailure(error: err.toString())),
                      (res) => right(response))))));
}
