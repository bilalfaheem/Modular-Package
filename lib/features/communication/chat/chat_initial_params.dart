import 'package:signalr_netcore/hub_connection.dart';

class ChatInitialParams {
  String? chatId, senderId, receiverId, chatName;
  final HubConnection? hubConnection;

  ChatInitialParams(
      {required this.hubConnection,
      this.chatId,
      this.senderId,
      this.receiverId,
      this.chatName});
  ChatInitialParams copyWith(
      {HubConnection? hubConnection,
      String? chatId,
      String? senderId,
      String? receiverId,
      String? chatName}) {
    return ChatInitialParams(
      hubConnection: hubConnection ?? this.hubConnection,
      chatId: chatId ?? this.chatId,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      chatName: chatName ?? this.chatName,
    );
  }
}
