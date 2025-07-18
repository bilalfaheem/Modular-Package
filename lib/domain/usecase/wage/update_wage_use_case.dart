import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/repository/wage/update_wage_repo.dart';
import 'package:service/domain/entities/wage/update_wage_entity.dart';
import 'package:service/domain/failures/wage/update_wage_failure.dart';

class UpdateWageUseCase {
  final UpdateWageRepo _repo;
  UpdateWageUseCase(this._repo);

  Future<Either<UpdateWageFailure, BaseEntity>> execute(
          UpdateWageEntity data) async =>
      await _repo.updateWage(data).then((value) => value.fold(
          (err) => left(UpdateWageFailure(error: err.error)),
          (response) => right(response)));
}
