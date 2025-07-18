import 'package:fpdart/fpdart.dart';
import 'package:service/data/header.dart/header.dart';
import 'package:service/data/model/invoice/invoice_data_model/invoice_data_model.dart';

import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/invoice/invoice_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/store/user_store.dart';
import 'package:service/domain/repository/invoice/invoices_repo.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/data/model/base_json.dart';
import 'package:service/domain/entities/invoice/invoices_entity.dart';

class InvoicesRestApiRepo implements InvoicesRepo {
  final Network network;
  final AppUrl appUrl;
  InvoicesRestApiRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity<List<InvoiceEntity>>>> invoices(
          InvoicesEntity data) =>
      network
          .get(
            appUrl.invoicesUrl,
            query: data.toJson().$2,
            Header.bearerHeaderWithApplicationJson(data.toJson().$1),
          )
          .then((value) =>
              value.fold((l) => left(RepoFailure(error: l.error)), (response) {
                try {
                  return right(BaseJson<List<InvoiceJson>>.fromJson(
                          response,
                          (response['data'] as List<dynamic>)
                              .map((e) => InvoiceJson.fromJson(
                                  e as Map<String, dynamic>))
                              .toList())
                      .toDomain((data) =>
                          data?.map((e) => e.toDomain()).toList() ?? []));
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              }));
}
