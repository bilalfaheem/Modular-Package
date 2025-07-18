import 'package:fpdart/fpdart.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/wage/update_wage_entity.dart';

abstract class UpdateWageRepo {
  final Network network;
  final AppUrl appUrl;

  UpdateWageRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity>> updateWage(UpdateWageEntity data);
}
