import 'package:fpdart/fpdart.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/invoice/invoice_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/invoice/invoices_entity.dart';

abstract class InvoicesRepo {
  final Network network;
  final AppUrl appUrl;

  InvoicesRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity<List<InvoiceEntity>>>> invoices(
      InvoicesEntity data);
}
