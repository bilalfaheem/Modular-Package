part of 'inbox_bloc.dart';

@immutable
sealed class InboxEvent {}

class FetchInboxEvent extends InboxEvent {
  final GetInboxEntity data;
  FetchInboxEvent(this.data);
}

class FetchMoreInboxEvent extends InboxEvent {
  final GetInboxEntity data;
  FetchMoreInboxEvent(this.data);
}
