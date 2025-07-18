import 'package:fpdart/fpdart.dart';
import 'package:service/data/header.dart/header.dart';
import 'package:service/data/model/update_invoice_data_model/update_invoice_data_model.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/store/user_store.dart';
import 'package:service/domain/repository/invoice/update_invoice_repo.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/data/model/base_json.dart';
import 'package:service/domain/entities/invoice/update_invoice_entity.dart';

class UpdateInvoiceRestApiRepo implements UpdateInvoiceRepo {
  final Network network;
  final AppUrl appUrl;
  UpdateInvoiceRestApiRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity<bool>>> updateInvoice(
          UpdateInvoiceEntity data) =>
      network
          .patch(appUrl.updateInvoiceUrl, data.toJson().$2,
              Header.bearerHeaderWithApplicationJson(data.toJson().$1),
              pathVariable: "${data.toJson().$3}/Status")
          .then((value) =>
              value.fold((l) => left(RepoFailure(error: l.error)), (response) {
                try {
                  return right(
                      BaseJson.fromJson(response, response['data'] as bool?)
                          .toDomain((data) => data ?? false));
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              }));
}
