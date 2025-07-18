import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/auth/change_password_entity.dart';
import 'package:service/domain/response/api_response.dart';
import 'package:service/domain/usecase/auth/change_password_use_case.dart';

import 'package:service/features/auth/change_password/change_password_initial_params.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePasswordInitialParams _initialParams;
  final ChangePasswordUseCase _useCase;
  ChangePasswordBloc(this._initialParams, this._useCase)
      : super(ChangePasswordState(initialParams: _initialParams)) {
    on<SubmitActionEvent>(_submitAction);
  }

  Future<void> _submitAction(
      SubmitActionEvent event, Emitter<ChangePasswordState> emit) async {
    emit(state.copyWith(changePasswordResponse: ApiResponse.loading()));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(
              changePasswordResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(
              state.copyWith(changePasswordResponse: ApiResponse.completed(r)));
        }));
  }
}
