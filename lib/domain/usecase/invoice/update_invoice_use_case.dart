import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/data/model/update_invoice_data_model/update_invoice_data_model.dart';
import 'package:service/domain/repository/invoice/update_invoice_repo.dart';
import 'package:service/domain/entities/invoice/update_invoice_entity.dart';
import 'package:service/domain/failures/invoice/update_invoice_failure.dart';
import 'package:service/domain/validator/invoice/update_invoice_validator.dart';

class UpdateInvoiceUseCase {
  final UpdateInvoiceRepo _repo;
  final UpdateInvoiceValidator _validator;
  UpdateInvoiceUseCase(this._repo, this._validator);

  Future<Either<UpdateInvoiceFailure, BaseEntity>> execute(
          UpdateInvoiceEntity data) async =>
      _validator.validate(data).fold(
          (err) => left(UpdateInvoiceFailure(error: err.error)),
          (res) async => await _repo.updateInvoice(res).then((value) =>
              value.fold((err) => left(UpdateInvoiceFailure(error: err.error)),
                  (response) => right(response))));
}
