part of 'invoices_bloc.dart';

@immutable
sealed class InvoicesEvent {}

class FetchInvoiceEvent extends InvoicesEvent {
  final InvoicesEntity data;
  FetchInvoiceEvent(this.data);
}

class FetchMoreInvoiceEvent extends InvoicesEvent {
  final InvoicesEntity data;
  FetchMoreInvoiceEvent(this.data);
}

class FetchCustomersEvent extends InvoicesEvent {
  final CustomersEntity data;
  FetchCustomersEvent(this.data);
}
