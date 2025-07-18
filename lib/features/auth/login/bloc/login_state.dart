part of 'login_bloc.dart';

@immutable
class LoginState {
  final LoginInitialParams initialParams;
  final ApiResponse<BaseEntity<UserTokenEntity>> loginResponse;

  const LoginState({
    required this.initialParams,
    this.loginResponse = const ApiResponse.init(),
  });

  LoginState copyWith({
    LoginInitialParams? initialParams,
    ApiResponse<BaseEntity<UserTokenEntity>>? loginResponse,
  }) {
    toString();
    return LoginState(
      initialParams: initialParams ?? this.initialParams,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }

  @override
  String toString() {
    return 'LoginState(initialParams: $initialParams, loginResponse: ${loginResponse.toString()})';
  }
}
