import 'package:fpdart/fpdart.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/staff/staff_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/staff/staffs_entity.dart';

abstract class StaffsRepo {
  final Network network;
  final AppUrl appUrl;

  StaffsRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity<List<StaffEntity>>>> staffs(
      StaffsEntity data);
}
