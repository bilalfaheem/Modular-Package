import 'package:service/domain/entities/communication/message_entity.dart';
import 'package:signalr_netcore/hub_connection.dart';

class SendMessageEntity {
  final String token;
  final String chatId, content;
  final String? attachmentName, contentType;

  final SenderEntity sender;
  final HubConnection? hubConnection;

  SendMessageEntity(
      {required this.token,
      required this.chatId,
      required this.content,
      this.attachmentName,
      this.contentType,
      required this.sender,
      required this.hubConnection});

  (String, Map<String, dynamic>) toJson() {
    var data = {
      "ChatId": chatId,
      "Content": content,
      // "Attachment": base64Encode(imageBytes),
      "AttachmentName": attachmentName,
      // "ContentType": image.mimeType,
      "Sender": sender.toJson(),
    };
    data.removeWhere((key, val) => val == null);

    return (token, data);
  }
}
