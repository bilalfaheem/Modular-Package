import 'package:service/data/model/communication/chat_json/message_json/sender_json.dart';
import 'package:service/domain/entities/communication/message_entity.dart';

class MessageJson {
  MessageJson({
    required this.id,
    required this.date,
    required this.attachment,
    required this.readers,
    required this.chatId,
    required this.content,
    required this.sender,
  });

  final String? id;
  final DateTime? date;
  final String? attachment;
  final List<dynamic> readers;
  final String? chatId;
  final String? content;
  final SenderJson? sender;

  factory MessageJson.fromJson(Map json) {
    return MessageJson(
      id: json["id"],
      date: DateTime.tryParse(json["date"] ?? ""),
      attachment: json["attachment"],
      readers: json["readers"] == null
          ? []
          : List<dynamic>.from(json["readers"]!.map((x) => x)),
      chatId: json["chatId"],
      content: json["content"],
      sender:
          json["sender"] == null ? null : SenderJson.fromJson(json["sender"]),
    );
  }

  MessageEntity toDomain() {
    return MessageEntity(
      id: id ?? "",
      date: date,
      attachment: attachment ?? "",
      readers: readers,
      chatId: chatId ?? "",
      content: content ?? "",
      sender: sender?.toDomain(),
    );
  }
}
