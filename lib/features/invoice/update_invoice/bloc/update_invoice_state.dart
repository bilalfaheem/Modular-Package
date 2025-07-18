part of 'update_invoice_bloc.dart';

@immutable
class UpdateInvoiceState {
  final UpdateInvoiceInitialParams initialParams;
  final ApiResponse<BaseEntity> updateInvoiceResponse;

  const UpdateInvoiceState({
    required this.initialParams,
    this.updateInvoiceResponse = const ApiResponse.init(),
  });

  UpdateInvoiceState copyWith({
    UpdateInvoiceInitialParams? initialParams,
    ApiResponse<BaseEntity>? updateInvoiceResponse,
  }) {
    UpdateInvoiceState data = UpdateInvoiceState(
      initialParams: initialParams ?? this.initialParams,
      updateInvoiceResponse:
          updateInvoiceResponse ?? this.updateInvoiceResponse,
    );

    Utils.logInfo(data.toString(), name: "UpdateInvoiceState");
    return data;
  }

  @override
  String toString() {
    return 'UpdateInvoiceState(initialParams: $initialParams, updateInvoiceResponse: ${updateInvoiceResponse.toString()})';
  }
}
