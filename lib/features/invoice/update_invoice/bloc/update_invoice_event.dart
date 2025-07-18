part of 'update_invoice_bloc.dart';

@immutable
sealed class UpdateInvoiceEvent {}

class UpdateActionEvent extends UpdateInvoiceEvent {
  final UpdateInvoiceEntity data;
  UpdateActionEvent(this.data);
}
