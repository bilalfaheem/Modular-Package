import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/invoice/update_invoice_entity.dart';
import 'package:service/domain/failures/validation_failure.dart';
import 'package:service/domain/validator/validator.dart';

class UpdateInvoiceValidator {
  Either<ValidationFailure, UpdateInvoiceEntity> validate(
      UpdateInvoiceEntity data) {
    if (Validator.validate(data.status, "Status") != null) {
      return left(
          ValidationFailure(error: Validator.validate(data.status, "Status")!));
    } else if (data.status == "Cancelled") {
      if (Validator.validate(data.comment, "Comment") != null) {
        return left(ValidationFailure(
            error: Validator.validate(data.comment, "Comment")!));
      } else {
        return right(data);
      }
    } else {
      return right(data);
    }
  }
}
