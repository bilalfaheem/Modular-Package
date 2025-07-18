part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent {}

class CreateChatEvent extends ChatEvent {
  final ChatEntity data;
  CreateChatEvent(this.data);
}

class GetChatEvent extends ChatEvent {
  final GetChatEntity data;
  GetChatEvent(this.data);
}

class JoinChatEvent extends ChatEvent {
  final GetChatEntity data;
  JoinChatEvent(this.data);
}
class ListenChatEvent extends ChatEvent {
  final ListenChatEntity data;
  ListenChatEvent(this.data);
}
class SendMessageEvent extends ChatEvent {
  final SendMessageEntity data;
  SendMessageEvent(this.data);
}
