import 'package:service/domain/entities/invoice/invoice_entity.dart';

class UpdateInvoiceInitialParams {
  final InvoiceEntity detail;
  const UpdateInvoiceInitialParams({
    required this.detail,
  });

  UpdateInvoiceInitialParams copyWith({InvoiceEntity? detail}) {
    return UpdateInvoiceInitialParams(detail: detail ?? this.detail);
  }
}
