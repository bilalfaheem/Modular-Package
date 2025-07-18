part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordEvent {}

class SubmitActionEvent extends ForgotPasswordEvent {
  final ForgotPasswordEntity data;
  SubmitActionEvent(this.data);
}
