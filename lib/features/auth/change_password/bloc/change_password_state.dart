part of 'change_password_bloc.dart';

@immutable
class ChangePasswordState {
  final ChangePasswordInitialParams initialParams;
  final ApiResponse<BaseEntity> changePasswordResponse;

  const ChangePasswordState({
    required this.initialParams,
    this.changePasswordResponse = const ApiResponse.init(),
  });

  ChangePasswordState copyWith({
    ChangePasswordInitialParams? initialParams,
    ApiResponse<BaseEntity>? changePasswordResponse,
  }) {
    toString();
    return ChangePasswordState(
      initialParams: initialParams ?? this.initialParams,
      changePasswordResponse:
          changePasswordResponse ?? this.changePasswordResponse,
    );
  }

  @override
  String toString() {
    return 'ChangePasswordState(initialParams: $initialParams, change_passwordResponse: ${changePasswordResponse.toString()})';
  }
}
