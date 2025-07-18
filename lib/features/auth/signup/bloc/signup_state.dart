part of 'signup_bloc.dart';

@immutable
class SignupState {
  final SignupInitialParams initialParams;
  final ApiResponse<BaseEntity> signupResponse;

  const SignupState({
    required this.initialParams,
    this.signupResponse = const ApiResponse.init(),
  });

  SignupState copyWith({
    SignupInitialParams? initialParams,
    ApiResponse<BaseEntity>? signupResponse,
  }) {
    toString();
    return SignupState(
      initialParams: initialParams ?? this.initialParams,
      signupResponse: signupResponse ?? this.signupResponse,
    );
  }

  @override
  String toString() {
    return 'SignupState(initialParams: $initialParams, signupResponse: ${signupResponse.toString()})';
  }
}
