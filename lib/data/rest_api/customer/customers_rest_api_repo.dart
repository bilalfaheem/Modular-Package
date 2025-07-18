import 'package:fpdart/fpdart.dart';
import 'package:service/data/header.dart/header.dart';
import 'package:service/data/model/base_json.dart';
import 'package:service/data/model/customer/customer_json/customer_json.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/customer/customer_entity.dart';
import 'package:service/domain/entities/customer/customers_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/repository/customer/customer_repo.dart';

class CustomersRestApiRepo implements CustomersRepo {
  final Network network;
  final AppUrl appUrl;
  CustomersRestApiRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity<List<CustomerEntity>>>> customers(
          CustomersEntity data) =>
      network
          .get(
            appUrl.customersUrl,
            query: data.toJson().$2,
            Header.bearerHeaderWithApplicationJson(data.toJson().$1),
          )
          .then((value) =>
              value.fold((l) => left(RepoFailure(error: l.error)), (response) {
                try {
                  return right(BaseJson<List<CustomerJson>>.fromJson(
                          response,
                          (response['data'] as List<dynamic>)
                              .map((e) => CustomerJson.fromJson(
                                  e as Map<String, dynamic>))
                              .toList())
                      .toDomain((data) =>
                          data?.map((e) => e.toDomain()).toList() ?? []));
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              }));
}
