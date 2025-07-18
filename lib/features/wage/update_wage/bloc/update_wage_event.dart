part of 'update_wage_bloc.dart';

@immutable
sealed class UpdateWageEvent {}

class SubmitActionEvent extends UpdateWageEvent {
  final UpdateWageEntity data;
  SubmitActionEvent(this.data);
}
