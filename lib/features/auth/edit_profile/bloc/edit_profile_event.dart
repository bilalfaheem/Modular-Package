part of 'edit_profile_bloc.dart';

@immutable
sealed class EditProfileEvent {}

class EditProfileActionEvent extends EditProfileEvent {
  final EditProfileEntity data;
  EditProfileActionEvent(this.data);
}

class UpdateProfilePictureActionEvent extends EditProfileEvent {
  final UpdateProfilePictureEntity data;
  UpdateProfilePictureActionEvent(this.data);
}
