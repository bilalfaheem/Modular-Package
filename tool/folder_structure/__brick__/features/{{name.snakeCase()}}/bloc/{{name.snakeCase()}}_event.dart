part of '{{name.snakeCase()}}_bloc.dart';

@immutable
sealed class {{name.pascalCase()}}Event {}

class SubmitActionEvent extends {{name.pascalCase()}}Event {
  final {{name.pascalCase()}}Entity data;
  SubmitActionEvent(this.data);
}
