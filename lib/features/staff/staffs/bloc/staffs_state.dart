part of 'staffs_bloc.dart';

@immutable
class StaffsState {
  final StaffsInitialParams initialParams;
  final ApiResponse<BaseEntity> staffsResponse;

  const StaffsState({
    required this.initialParams,
    this.staffsResponse = const ApiResponse.init(),
  });

  StaffsState copyWith({
    StaffsInitialParams? initialParams,
    ApiResponse<BaseEntity>? staffsResponse,
  }) {
    StaffsState data = StaffsState(
      initialParams: initialParams ?? this.initialParams,
      staffsResponse: staffsResponse ?? this.staffsResponse,
    );
    Utils.logInfo(data.toString(), name: 'Staff');
    return data;
  }

  @override
  String toString() {
    return 'StaffsState(initialParams: $initialParams, staffsResponse: ${staffsResponse.toString()})';
  }
}
