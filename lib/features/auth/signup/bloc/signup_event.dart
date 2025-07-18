part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class SubmitActionEvent extends SignupEvent {
  final SignupEntity data;
  SubmitActionEvent(this.data);
}
