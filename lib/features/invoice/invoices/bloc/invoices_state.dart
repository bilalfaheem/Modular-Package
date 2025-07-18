part of 'invoices_bloc.dart';

@immutable
class InvoicesState {
  final InvoicesInitialParams initialParams;
  final PaginationEntity pagination;
  final InvoicesEntity invoicesEntity;
  final ApiResponse<BaseEntity<List<InvoiceEntity>>> invoicesResponse;
  final ApiResponse<BaseEntity<List<InvoiceEntity>>> invoicesPaginationResponse;
  final ApiResponse<BaseEntity<List<CustomerEntity>>> customerResponse;

  const InvoicesState(
      {required this.initialParams,
      this.invoicesEntity = const InvoicesEntity.empty(),
      this.pagination = const PaginationEntity.empty(),
      this.invoicesResponse = const ApiResponse.init(),
      this.invoicesPaginationResponse = const ApiResponse.init(),
      this.customerResponse = const ApiResponse.init()});

  InvoicesState copyWith(
      {InvoicesInitialParams? initialParams,
      InvoicesEntity? invoicesEntity,
      PaginationEntity? pagination,
      ApiResponse<BaseEntity<List<InvoiceEntity>>>? invoicesResponse,
      ApiResponse<BaseEntity<List<InvoiceEntity>>>? invoicesPaginationResponse,
      ApiResponse<BaseEntity<List<CustomerEntity>>>? customerResponse}) {
    InvoicesState data = InvoicesState(
        initialParams: initialParams ?? this.initialParams,
        invoicesEntity: invoicesEntity ?? this.invoicesEntity,
        pagination: pagination ?? this.pagination,
        invoicesResponse: invoicesResponse ?? this.invoicesResponse,
        invoicesPaginationResponse:
            invoicesPaginationResponse ?? this.invoicesPaginationResponse,
        customerResponse: customerResponse ?? this.customerResponse);
    Utils.logInfo(data.toString(), name: "Invoices State");
    return data;
  }

  @override
  String toString() {
    return 'InvoicesState(initialParams: $initialParams, invoicesResponse: ${invoicesResponse.toString()})';
  }
}
