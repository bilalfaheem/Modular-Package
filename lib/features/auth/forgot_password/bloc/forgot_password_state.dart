part of 'forgot_password_bloc.dart';

@immutable
class ForgotPasswordState {
  final ForgotPasswordInitialParams initialParams;
  final ApiResponse<BaseEntity> forgotPasswordResponse;

  const ForgotPasswordState({
    required this.initialParams,
    this.forgotPasswordResponse = const ApiResponse.init(),
  });

  ForgotPasswordState copyWith({
    ForgotPasswordInitialParams? initialParams,
    ApiResponse<BaseEntity>? forgotPasswordResponse,
  }) {
    toString();
    return ForgotPasswordState(
      initialParams: initialParams ?? this.initialParams,
      forgotPasswordResponse:
          forgotPasswordResponse ?? this.forgotPasswordResponse,
    );
  }

  @override
  String toString() {
    return 'ForgotPasswordState(initialParams: $initialParams, loginResponse: ${forgotPasswordResponse.toString()})';
  }
}
