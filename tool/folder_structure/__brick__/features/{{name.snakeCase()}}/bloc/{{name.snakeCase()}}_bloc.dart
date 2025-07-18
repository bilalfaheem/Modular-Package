import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:domain/entities/base_entity.dart';
import 'package:domain/entities/{{name.snakeCase()}}_entity.dart';
import 'package:domain/response/api_response.dart';
import 'package:domain/usecase/{{name.snakeCase()}}_use_case.dart';
import 'package:features/{{name.snakeCase()}}/{{name.snakeCase()}}_initial_params.dart';

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
    emit(state.copyWith(loginResponse: ApiResponse.loading()));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(loginResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(loginResponse: ApiResponse.completed(r)));
        }));
  }
}
