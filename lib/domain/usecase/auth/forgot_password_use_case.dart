import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/auth/forgot_password_entity.dart';
import 'package:service/domain/failures/forgot_password_failure.dart';
import 'package:service/domain/repository/auth/forgot_password_repo.dart';
import 'package:service/domain/validator/auth/forgot_password_validator.dart';

class ForgotPasswordUseCase {
  final ForgotPasswordRepo _repo;
  final ForgotPasswordValidator _validator;
  ForgotPasswordUseCase(this._repo, this._validator);

  Future<Either<ForgotPasswordFailure, BaseEntity>> execute(
          ForgotPasswordEntity data) async =>
      _validator.validate(data).fold(
          (err) => left(ForgotPasswordFailure(error: err.error)),
          (data) async => await _repo.forgotPassword(data).then((value) =>
              value.fold((err) => left(ForgotPasswordFailure(error: err.error)),
                  (response) => right(response))));
}
