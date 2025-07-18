import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/invoice/update_invoice_entity.dart';
import 'package:service/domain/response/api_response.dart';
import 'package:service/domain/usecase/invoice/update_invoice_use_case.dart';
import 'package:service/features/invoice/update_invoice/update_invoice_initial_params.dart';
import 'package:service/utils/utils.dart';

part 'update_invoice_event.dart';
part 'update_invoice_state.dart';

class UpdateInvoiceBloc extends Bloc<UpdateInvoiceEvent, UpdateInvoiceState> {
  final UpdateInvoiceInitialParams _initialParams;
  final UpdateInvoiceUseCase _useCase;
  UpdateInvoiceBloc(this._initialParams, this._useCase)
      : super(UpdateInvoiceState(initialParams: _initialParams)) {
    on<UpdateActionEvent>(_updateAction);
  }

  Future<void> _updateAction(
      UpdateActionEvent event, Emitter<UpdateInvoiceState> emit) async {
    emit(state.copyWith(updateInvoiceResponse: ApiResponse.loading()));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(
              updateInvoiceResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(
              updateInvoiceResponse: ApiResponse.completed(r),
              initialParams: state.initialParams.copyWith(
                  detail: state.initialParams.detail.copyWith(
                      status: state.initialParams.detail.status
                          .copyWith(status: 'Paid')))));
        }));
  }
}
