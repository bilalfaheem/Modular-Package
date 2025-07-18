part of 'staffs_bloc.dart';

@immutable
sealed class StaffsEvent {}

class SubmitActionEvent extends StaffsEvent {
  final StaffsEntity data;
  SubmitActionEvent(this.data);
}
