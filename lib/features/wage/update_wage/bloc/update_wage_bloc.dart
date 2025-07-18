import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/wage/update_wage_entity.dart';
import 'package:service/domain/response/api_response.dart';
import 'package:service/domain/usecase/wage/update_wage_use_case.dart';
import 'package:service/features/wage/update_wage/update_wage_initial_params.dart';
import 'package:service/utils/utils.dart';

part 'update_wage_event.dart';
part 'update_wage_state.dart';

class UpdateWageBloc extends Bloc<UpdateWageEvent, UpdateWageState> {
  final UpdateWageInitialParams _initialParams;
  final UpdateWageUseCase _useCase;
  UpdateWageBloc(this._initialParams, this._useCase)
      : super(UpdateWageState(initialParams: _initialParams)) {
    on<SubmitActionEvent>(_submitAction);
  }

  Future<void> _submitAction(
      SubmitActionEvent event, Emitter<UpdateWageState> emit) async {
    emit(state.copyWith(updateWageResponse: ApiResponse.loading()));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(updateWageResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(updateWageResponse: ApiResponse.completed(r)));
        }));
  }
}
