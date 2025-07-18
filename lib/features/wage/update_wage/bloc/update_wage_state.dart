part of 'update_wage_bloc.dart';

@immutable
class UpdateWageState {
  final UpdateWageInitialParams initialParams;
  final ApiResponse<BaseEntity> updateWageResponse;

  const UpdateWageState({
    required this.initialParams,
    this.updateWageResponse = const ApiResponse.init(),
  });

  UpdateWageState copyWith({
    UpdateWageInitialParams? initialParams,
    ApiResponse<BaseEntity>? updateWageResponse,
  }) {
    UpdateWageState data = UpdateWageState(
      initialParams: initialParams ?? this.initialParams,
      updateWageResponse: updateWageResponse ?? this.updateWageResponse,
    );
    Utils.logInfo(data.toString(), name: "UpdateWage");
    return data;
  }

  @override
  String toString() {
    return 'UpdateWageState(initialParams: $initialParams, updateWageResponse: ${updateWageResponse.toString()})';
  }
}
