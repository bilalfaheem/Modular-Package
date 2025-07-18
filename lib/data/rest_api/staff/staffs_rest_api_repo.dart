import 'package:fpdart/fpdart.dart';
import 'package:service/data/header.dart/header.dart';
import 'package:service/data/model/base_json.dart';
import 'package:service/data/model/staff/staff_json/staff_json.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/staff/staff_entity.dart';
import 'package:service/domain/entities/staff/staffs_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/repository/staff/staffs_repo.dart';

class StaffsRestApiRepo implements StaffsRepo {
  final Network network;
  final AppUrl appUrl;
  StaffsRestApiRepo(this.network, this.appUrl);
  @override
  Future<Either<RepoFailure, BaseEntity<List<StaffEntity>>>> staffs(StaffsEntity data) => network
      .get(
        appUrl.staffsUrl,
        query: data.toJson().$2,
        Header.bearerHeaderWithApplicationJson(data.toJson().$1),
      )
      .then((value) => value.fold((l) => left(RepoFailure(error: l.error)), (response) {
            try {
              return right(BaseJson<List<StaffJson>>.fromJson(
                      response, (response['data'] as List<dynamic>).map((e) => StaffJson.fromJson(e as Map<String, dynamic>)).toList())
                  .toDomain((data) => data?.map((e) => e.toDomain()).toList() ?? []));
            } catch (e) {
              return left(RepoFailure(error: e.toString()));
            }
          }));
}
