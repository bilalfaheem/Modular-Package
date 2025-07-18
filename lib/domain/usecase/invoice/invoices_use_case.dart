import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/customer/customer_entity.dart';
import 'package:service/domain/entities/customer/customers_entity.dart';
import 'package:service/domain/entities/invoice/invoice_entity.dart';
import 'package:service/domain/repository/customer/customer_repo.dart';

import 'package:service/domain/repository/invoice/invoices_repo.dart';
import 'package:service/domain/entities/invoice/invoices_entity.dart';
import 'package:service/domain/failures/invoice/invoices_failure.dart';

class InvoicesUseCase {
  final InvoicesRepo _repo;
  final CustomersRepo _customersRepo;
  InvoicesUseCase(this._repo, this._customersRepo);

  Future<Either<InvoicesFailure, BaseEntity<List<InvoiceEntity>>>> execute(
          InvoicesEntity data) async =>
      await _repo.invoices(data).then((value) => value.fold(
          (err) => left(InvoicesFailure(error: err.error)),
          (response) => right(response)));

  Future<Either<InvoicesFailure, BaseEntity<List<CustomerEntity>>>>
      executeCustomers(CustomersEntity data) async =>
          await _customersRepo.customers(data).then((value) => value.fold(
              (err) => left(InvoicesFailure(error: err.error)),
              (response) => right(response)));
}
