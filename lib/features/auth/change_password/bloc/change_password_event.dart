part of 'change_password_bloc.dart';

@immutable
sealed class ChangePasswordEvent {}

class SubmitActionEvent extends ChangePasswordEvent {
  final ChangePasswordEntity data;
  SubmitActionEvent(this.data);
}
