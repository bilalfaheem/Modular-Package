import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/repository/staff/staffs_repo.dart';
import 'package:service/domain/entities/staff/staffs_entity.dart';
import 'package:service/domain/failures/staff/staffs_failure.dart';

class StaffsUseCase {
  final StaffsRepo _repo;
  StaffsUseCase(this._repo);

  Future<Either<StaffsFailure, BaseEntity>> execute(StaffsEntity data) async =>
      await _repo.staffs(data).then((value) => value.fold(
          (err) => left(StaffsFailure(error: err.error)),
          (response) => right(response)));
}
