import 'package:fpdart/fpdart.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/wage/wage_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/wage/wages_entity.dart';

abstract class WagesRepo {
  final Network network;
  final AppUrl appUrl;

  WagesRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity<List<WageEntity>>>> wages(WagesEntity data);
}
