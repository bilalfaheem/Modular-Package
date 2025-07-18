part of 'complete_profile_bloc.dart';

@immutable
sealed class CompleteProfileEvent {}

class FetchRolesEvent extends CompleteProfileEvent {
  final RolesEntity data;
  FetchRolesEvent(this.data);
}
