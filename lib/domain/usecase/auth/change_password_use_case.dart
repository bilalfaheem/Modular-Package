import 'package:fpdart/fpdart.dart';

import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/repository/auth/change_password_repo.dart';
import 'package:service/domain/entities/auth/change_password_entity.dart';
import 'package:service/domain/failures/change_password_failure.dart';
import 'package:service/domain/validator/auth/change_password_validator.dart';

class ChangePasswordUseCase {
  final ChangePasswordRepo _repo;
  final ChangePasswordValidator _validator;
  ChangePasswordUseCase(this._repo, this._validator);

  Future<Either<ChangePasswordFailure, BaseEntity>> execute(
          ChangePasswordEntity data) async =>
      _validator.validate(data).fold(
          (err) => left(ChangePasswordFailure(error: err.error)),
          (res) async => await _repo.changePassword(res).then((value) =>
              value.fold((err) => left(ChangePasswordFailure(error: err.error)),
                  (response) => right(response))));
}
