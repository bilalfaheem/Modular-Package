import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/auth/signup_entity.dart';
import 'package:service/domain/response/api_response.dart';
import 'package:service/domain/usecase/auth/signup_use_case.dart';
import 'package:service/features/auth/signup/signup_initial_params.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupInitialParams _initialParams;
  final SignupUseCase _useCase;
  SignupBloc(this._initialParams, this._useCase)
      : super(SignupState(initialParams: _initialParams)) {
    on<SubmitActionEvent>(_submitAction);
  }

  Future<void> _submitAction(
      SubmitActionEvent event, Emitter<SignupState> emit) async {
    emit(state.copyWith(signupResponse: ApiResponse.loading()));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(signupResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(signupResponse: ApiResponse.completed(r)));
        }));
  }
}
