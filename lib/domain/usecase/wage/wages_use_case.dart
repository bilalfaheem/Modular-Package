import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/staff/staff_entity.dart';
import 'package:service/domain/entities/staff/staffs_entity.dart';
import 'package:service/domain/entities/wage/wage_entity.dart';
import 'package:service/domain/failures/staff/staffs_failure.dart';
import 'package:service/domain/repository/staff/staffs_repo.dart';
import 'package:service/domain/repository/wage/wages_repo.dart';
import 'package:service/domain/entities/wage/wages_entity.dart';
import 'package:service/domain/failures/wage/wages_failure.dart';

class WagesUseCase {
  final WagesRepo _repo;
  final StaffsRepo _staffsRepo;
  WagesUseCase(this._repo, this._staffsRepo);

  Future<Either<WagesFailure, BaseEntity<List<WageEntity>>>> execute(WagesEntity data) async =>
      await _repo.wages(data).then((value) => value.fold(
          (err) => left(WagesFailure(error: err.error)),
          (response) => right(response)));

  Future<Either<StaffsFailure, BaseEntity<List<StaffEntity>>>> executeStaffs(
          StaffsEntity data) async =>
      await _staffsRepo.staffs(data).then((value) => value.fold(
          (err) => left(StaffsFailure(error: err.error)),
          (response) => right(response)));
}
