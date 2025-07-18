import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/auth/signup_entity.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/failures/auth/signup_failure.dart';
import 'package:service/domain/repository/auth/signup_repo.dart';
import 'package:service/domain/validator/auth/signup_validator.dart';
import 'package:service/domain/usecase/auth/login_use_case.dart';
import '../../entities/auth/login_entity.dart';

class SignupUseCase {
  final SignupRepo _repo;
  final SignupValidator _validator;
  final LoginUseCase _loginUseCase;

  SignupUseCase(this._repo, this._validator, this._loginUseCase);

  Future<Either<SignupFailure, BaseEntity>> execute(SignupEntity data) async =>
      _validator.validate(data).fold(
          (err) => left(SignupFailure(error: err.error)),
          (res) async => await _repo.signup(res).then((value) => value.fold(
              (err) => left(SignupFailure(error: err.error)),
              (response) => _loginUseCase
                  .execute(LoginEntity(
                      userName: data.email, password: data.password))
                  .then((onValue) => onValue.fold(
                      (error) => left(SignupFailure(error: error.error)),
                      (result) => right(response))))));
}
