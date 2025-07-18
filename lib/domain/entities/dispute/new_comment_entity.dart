class NewCommentEntity {
  String description;
  DateTime date;
  String userId;
  String name;
  List<dynamic> attachments;

  NewCommentEntity({
    required this.description,
    required this.date,
    required this.userId,
    required this.name,
    required this.attachments,
  });

  NewCommentEntity copyWith({
    String? description,
    DateTime? date,
    String? userId,
    String? name,
    List<dynamic>? attachments,
  }) {
    return NewCommentEntity(
      description: description ?? this.description,
      date: date ?? this.date,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      attachments: attachments ?? this.attachments,
    );
  }
}
