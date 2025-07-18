import 'package:service/domain/entities/dispute/new_comment_entity.dart';

class CommentJson {
  String? description;
  DateTime? date;
  String? userId;
  String? name;
  List<dynamic>? attachments;

  CommentJson({
    this.description,
    this.date,
    this.userId,
    this.name,
    this.attachments,
  });

  factory CommentJson.fromJson(Map json) => CommentJson(
        description: json["description"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        userId: json["userId"],
        name: json["name"],
        attachments: json["attachments"] == null ? [] : List<dynamic>.from(json["attachments"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "date": date?.toIso8601String(),
        "userId": userId,
        "name": name,
        "attachments": attachments == null ? [] : List<dynamic>.from(attachments!.map((x) => x)),
      };

  NewCommentEntity toDomain() {
    return NewCommentEntity(
      description: description ?? '',
      date: date ?? DateTime.now(),
      userId: userId ?? '',
      name: name ?? '',
      attachments: attachments ?? [],
    );
  }
}
