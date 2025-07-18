class MessageEntity {
  final String id;
  final DateTime? date;
  final String attachment;
  final List<dynamic> readers;
  final String chatId;
  final String content;
  final SenderEntity? sender;

  MessageEntity({
    required this.id,
    required this.date,
    required this.attachment,
    required this.readers,
    required this.chatId,
    required this.content,
    required this.sender,
  });

  MessageEntity copyWith({
    String? id,
    DateTime? date,
    String? attachment,
    List<dynamic>? readers,
    String? chatId,
    String? content,
    SenderEntity? sender,
  }) {
    return MessageEntity(
      id: id ?? this.id,
      date: date ?? this.date,
      attachment: attachment ?? this.attachment,
      readers: readers ?? this.readers,
      chatId: chatId ?? this.chatId,
      content: content ?? this.content,
      sender: sender ?? this.sender,
    );
  }
}
class SenderEntity {
  final String id;
  final String name;
  final String profileUrl;

  SenderEntity({
    required this.id,
    required this.name,
    required this.profileUrl,
  });

  SenderEntity copyWith({
    String? id,
    String? name,
    String? profileUrl,
  }) {
    return SenderEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      profileUrl: profileUrl ?? this.profileUrl,
    );
  }

    Map<String, dynamic> toJson() {
    return {
      "Id": id,
      "Name": name,
      "ProfileUrl": profileUrl,
    };
  }
}
