part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class SubmitActionEvent extends LoginEvent {
  final LoginEntity data;
  SubmitActionEvent(this.data);
}
