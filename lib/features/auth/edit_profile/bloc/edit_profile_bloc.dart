import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:service/domain/entities/auth/edit_profile_entity.dart';
import 'package:service/domain/entities/auth/update_profile_picture_entity.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/response/api_response.dart';
import 'package:service/domain/usecase/auth/edit_profile_use_case.dart';
import 'package:service/features/auth/edit_profile/edit_profile_initial_params.dart';
part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {
  final EditProfileInitialParams _initialParams;
  final EditProfileUseCase _useCase;
  EditProfileBloc(this._initialParams, this._useCase)
      : super(EditProfileState(initialParams: _initialParams)) {
    on<EditProfileActionEvent>(_editProfileAction);
    on<UpdateProfilePictureActionEvent>(_updateProfilePictureAction);
  }

  Future<void> _editProfileAction(
      EditProfileActionEvent event, Emitter<EditProfileState> emit) async {
    emit(state.copyWith(editProfileResponse: ApiResponse.loading()));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(editProfileResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(editProfileResponse: ApiResponse.completed(r)));
        }));
  }

  Future<void> _updateProfilePictureAction(
      UpdateProfilePictureActionEvent event,
      Emitter<EditProfileState> emit) async {
    emit(state.copyWith(updateProfilePictureResponse: ApiResponse.loading()));
    await _useCase
        .updateProfilePictureExecute(event.data)
        .then((value) => value.fold((l) {
              emit(state.copyWith(
                  updateProfilePictureResponse: ApiResponse.error(l.error)));
            }, (r) {
              emit(state.copyWith(
                  updateProfilePictureResponse: ApiResponse.completed(r)));
            }));
  }
}
