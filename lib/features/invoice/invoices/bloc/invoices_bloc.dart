import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/customer/customer_entity.dart';
import 'package:service/domain/entities/customer/customers_entity.dart';
import 'package:service/domain/entities/invoice/invoice_entity.dart';
import 'package:service/domain/entities/invoice/invoices_entity.dart';
import 'package:service/domain/entities/pagination_entity.dart';
import 'package:service/domain/response/api_response.dart';
import 'package:service/domain/usecase/invoice/invoices_use_case.dart';
import 'package:service/features/invoice/invoices/invoices_initial_params.dart';
import 'package:service/utils/utils.dart';

part 'invoices_event.dart';
part 'invoices_state.dart';

class InvoicesBloc extends Bloc<InvoicesEvent, InvoicesState> {
  final InvoicesInitialParams _initialParams;
  final InvoicesUseCase _useCase;
  InvoicesBloc(this._initialParams, this._useCase)
      : super(InvoicesState(
            initialParams: _initialParams,
            invoicesEntity: InvoicesEntity.empty())) {
    on<FetchInvoiceEvent>(_fetchInvoice);
    on<FetchMoreInvoiceEvent>(_fetchMoreInvoice);
    on<FetchCustomersEvent>(_fetchCustomers);
  }

  Future<void> _fetchInvoice(
      FetchInvoiceEvent event, Emitter<InvoicesState> emit) async {
    emit(state.copyWith(
        invoicesResponse: ApiResponse.loading(), invoicesEntity: event.data));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(invoicesResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(
              pagination: r.pagination,
              invoicesResponse: ApiResponse.completed(r)));
        }));
  }

  Future<void> _fetchMoreInvoice(
      FetchMoreInvoiceEvent event, Emitter<InvoicesState> emit) async {
    emit(state.copyWith(
        invoicesPaginationResponse: ApiResponse.loading(),
        invoicesEntity: event.data));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(
              invoicesPaginationResponse: ApiResponse.error(l.error)));
          Utils.logError(state.toString(), name: "InvoicesState");
        }, (r) {
          emit(state.copyWith(
              pagination: r.pagination,
              invoicesPaginationResponse: ApiResponse.completed(r)));
          Utils.logSuccess(state.toString(), name: "InvoicesState");
        }));
  }

  Future<void> _fetchCustomers(
      FetchCustomersEvent event, Emitter<InvoicesState> emit) async {
    emit(state.copyWith(customerResponse: ApiResponse.loading()));
    await _useCase.executeCustomers(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(customerResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(customerResponse: ApiResponse.completed(r)));
        }));
  }
}
