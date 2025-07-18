part of '{{name.snakeCase()}}_bloc.dart';

@immutable
class {{name.pascalCase()}}State {
  final {{name.pascalCase()}}InitialParams initialParams;
  final ApiResponse<BaseEntity<UserTokenEntity>> loginResponse;

  const {{name.pascalCase()}}State({
    required this.initialParams,
    this.loginResponse = const ApiResponse.init(),
  });

  {{name.pascalCase()}}State copyWith({
    {{name.pascalCase()}}InitialParams? initialParams,
    ApiResponse<BaseEntity<UserTokenEntity>>? loginResponse,
  }) {
    toString();
    return {{name.pascalCase()}}State(
      initialParams: initialParams ?? this.initialParams,
      loginResponse: loginResponse ?? this.loginResponse,
    );
  }

  @override
  String toString() {
    return '{{name.pascalCase()}}State(initialParams: $initialParams, loginResponse: ${loginResponse.toString()})';
  }
}
