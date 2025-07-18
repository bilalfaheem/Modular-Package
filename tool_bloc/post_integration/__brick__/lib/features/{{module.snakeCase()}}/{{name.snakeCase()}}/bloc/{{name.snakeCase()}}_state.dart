part of '{{name.snakeCase()}}_bloc.dart';

@immutable
class {{name.pascalCase()}}State {
  final {{name.pascalCase()}}InitialParams initialParams;
  final ApiResponse<BaseEntity> {{name.camelCase()}}Response;

  const {{name.pascalCase()}}State({
    required this.initialParams,
    this.{{name.camelCase()}}Response = const ApiResponse.init(),
  });

   {{name.pascalCase()}}State copyWith({
    {{name.pascalCase()}}InitialParams? initialParams,
    ApiResponse<BaseEntity>? {{name.camelCase()}}Response,
  }) {
    {{name.pascalCase()}}State data =   {{name.pascalCase()}}State(
      initialParams: initialParams ?? this.initialParams,
      {{name.camelCase()}}Response: {{name.camelCase()}}Response ?? this.{{name.camelCase()}}Response,
    );
    Utils.logInfo(data.toString(), name: "{{name.pascalCase()}}");
    return data;
  }

  @override
  String toString() {
    return '{{name.pascalCase()}}State(initialParams: $initialParams, {{name.camelCase()}}Response: ${{{name.camelCase()}}Response.toString()})';
  }
}
