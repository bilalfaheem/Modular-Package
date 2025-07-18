import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:service/domain/entities/auth/roles_entity.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/auth/complete_profile_entity.dart';
import 'package:service/domain/response/api_response.dart';
import 'package:service/domain/usecase/auth/complete_profile_use_case.dart';
import 'package:service/features/auth/complete_profile/complete_profile_initial_params.dart';

part 'complete_profile_event.dart';
part 'complete_profile_state.dart';

class CompleteProfileBloc
    extends Bloc<CompleteProfileEvent, CompleteProfileState> {
  final CompleteProfileInitialParams _initialParams;
  final CompleteProfileUseCase _useCase;
  CompleteProfileBloc(this._initialParams, this._useCase)
      : super(CompleteProfileState(initialParams: _initialParams)) {
    on<FetchRolesEvent>(_fetchRoles);
  }

  Future<void> _fetchRoles(
      FetchRolesEvent event, Emitter<CompleteProfileState> emit) async {
    emit(state.copyWith(completeProfileResponse: ApiResponse.loading()));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(
              completeProfileResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(
              completeProfileResponse: ApiResponse.completed(r)));
        }));
  }
}
