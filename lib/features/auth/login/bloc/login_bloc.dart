import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/auth/login_entity.dart';
import 'package:service/domain/entities/user_token_entity.dart';
import 'package:service/domain/response/api_response.dart';
import 'package:service/domain/usecase/auth/login_use_case.dart';
import 'package:service/features/auth/login/login_initial_params.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginInitialParams _initialParams;
  final LoginUseCase _useCase;
  LoginBloc(this._initialParams, this._useCase)
      : super(LoginState(initialParams: _initialParams)) {
    on<SubmitActionEvent>(_submitAction);
  }

  Future<void> _submitAction(
      SubmitActionEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginResponse: ApiResponse.loading()));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(loginResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(loginResponse: ApiResponse.completed(r)));
        }));
  }
}
