import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/staff/staffs_entity.dart';
import 'package:service/domain/response/api_response.dart';
import 'package:service/domain/usecase/staff/staffs_use_case.dart';
import 'package:service/features/staff/staffs/staffs_initial_params.dart';
import 'package:service/utils/utils.dart';

part 'staffs_event.dart';
part 'staffs_state.dart';

class StaffsBloc extends Bloc<StaffsEvent, StaffsState> {
  final StaffsInitialParams _initialParams;
  final StaffsUseCase _useCase;
  StaffsBloc(this._initialParams, this._useCase)
      : super(StaffsState(initialParams: _initialParams)) {
    on<SubmitActionEvent>(_submitAction);
  }

  Future<void> _submitAction(
      SubmitActionEvent event, Emitter<StaffsState> emit) async {
    emit(state.copyWith(staffsResponse: ApiResponse.loading()));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(staffsResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(staffsResponse: ApiResponse.completed(r)));
        }));
  }
}
