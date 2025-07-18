part of 'edit_profile_bloc.dart';

@immutable
class EditProfileState {
  final EditProfileInitialParams initialParams;
  final ApiResponse<BaseEntity> editProfileResponse;
  final ApiResponse<BaseEntity> updateProfilePictureResponse;

  const EditProfileState({
    required this.initialParams,
    this.editProfileResponse = const ApiResponse.init(),
    this.updateProfilePictureResponse = const ApiResponse.init(),
  });

  EditProfileState copyWith({
    EditProfileInitialParams? initialParams,
    ApiResponse<BaseEntity>? editProfileResponse,
    ApiResponse<BaseEntity>? updateProfilePictureResponse,
  }) {
    toString();
    return EditProfileState(
      initialParams: initialParams ?? this.initialParams,
      editProfileResponse: editProfileResponse ?? this.editProfileResponse,
      updateProfilePictureResponse:
          updateProfilePictureResponse ?? this.updateProfilePictureResponse,
    );
  }

  @override
  String toString() {
    return 'EditProfileState(initialParams: $initialParams, edit_profileResponse: ${editProfileResponse.toString()})';
  }
}
