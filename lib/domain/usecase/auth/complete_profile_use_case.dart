import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/auth/roles_entity.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/failures/auth/complete_profile_failure.dart';
import 'package:service/domain/repository/auth/complete_profile_repo.dart';
import 'package:service/domain/validator/auth/complete_profile_validator.dart';

class CompleteProfileUseCase {
  final CompleteProfileRepo _repo;
  final CompleteProfileValidator _validator;
  CompleteProfileUseCase(this._repo, this._validator);

  Future<Either<CompleteProfileFailure, BaseEntity<List<String>>>> execute(
          RolesEntity data) async =>
      _validator.validate(data).fold(
          (err) => left(CompleteProfileFailure(error: err.error)),
          (data) async => await _repo.roles(data).then((value) => value.fold(
              (err) => left(CompleteProfileFailure(error: err.error)),
              (response) => right(response))));
}
