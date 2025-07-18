import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/auth/forgot_password_entity.dart';
import 'package:service/domain/response/api_response.dart';
import 'package:service/domain/usecase/auth/forgot_password_use_case.dart';
import 'package:service/features/auth/forgot_password/forgot_password_initial_params.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordInitialParams _initialParams;
  final ForgotPasswordUseCase _useCase;
  ForgotPasswordBloc(this._initialParams, this._useCase)
      : super(ForgotPasswordState(initialParams: _initialParams)) {
    on<SubmitActionEvent>(_submitAction);
  }

  Future<void> _submitAction(
      SubmitActionEvent event, Emitter<ForgotPasswordState> emit) async {
    emit(state.copyWith(forgotPasswordResponse: ApiResponse.loading()));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(
              forgotPasswordResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(
              state.copyWith(forgotPasswordResponse: ApiResponse.completed(r)));
        }));
  }
}
