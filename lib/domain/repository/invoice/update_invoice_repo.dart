import 'package:fpdart/fpdart.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/invoice/update_invoice_entity.dart';

abstract class UpdateInvoiceRepo {
  final Network network;
  final AppUrl appUrl;

  UpdateInvoiceRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity<bool>>> updateInvoice(
      UpdateInvoiceEntity data);
}
