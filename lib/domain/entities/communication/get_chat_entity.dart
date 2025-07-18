import 'package:signalr_netcore/hub_connection.dart';

class GetChatEntity {
  final String token;
  final String chatId;
  final HubConnection? hubConnection;


  GetChatEntity({required this.token, required this.chatId,required this.hubConnection});

  (String, String) toJson() {
    return (
      token,
      chatId,
    );
  }
}
