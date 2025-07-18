part of 'wages_bloc.dart';

@immutable
sealed class WagesEvent {}

class FetchWagesEvent extends WagesEvent {
  final WagesEntity data;
  FetchWagesEvent(this.data);
}

class FetchMoreWagesEvent extends WagesEvent {
  final WagesEntity data;
  FetchMoreWagesEvent(this.data);
}

class FetchStaffsEvent extends WagesEvent {
  final StaffsEntity data;
  FetchStaffsEvent(this.data);
}
