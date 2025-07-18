import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/{{module.snakeCase()}}/{{name.snakeCase()}}_entity.dart';
import 'package:service/domain/response/api_response.dart';
import 'package:service/domain/usecase/{{module.snakeCase()}}/{{name.snakeCase()}}_use_case.dart';
import 'package:service/features/{{module.snakeCase()}}/{{name.snakeCase()}}/{{name.snakeCase()}}_initial_params.dart';
import 'package:service/utils/utils.dart';

part '{{name.snakeCase()}}_event.dart';
part '{{name.snakeCase()}}_state.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  final {{name.pascalCase()}}InitialParams _initialParams;
  final {{name.pascalCase()}}UseCase _useCase;
  {{name.pascalCase()}}Bloc(this._initialParams, this._useCase)
      : super({{name.pascalCase()}}State(initialParams: _initialParams)) {
    on<SubmitActionEvent>(_submitAction);
  }

  Future<void> _submitAction(
      SubmitActionEvent event, Emitter<{{name.pascalCase()}}State> emit) async {
    emit(state.copyWith({{name.camelCase()}}Response: ApiResponse.loading()));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith({{name.camelCase()}}Response: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith({{name.camelCase()}}Response: ApiResponse.completed(r)));
        }));
  }
}
