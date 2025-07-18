import 'package:collection/collection.dart';
import 'package:service/domain/entities/wage/wage_entity.dart';

class Status {
  String? status;
  String? comment;
  String? userId;
  DateTime? date;

  Status({this.status, this.comment, this.userId, this.date});

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        status: json['status'] as String?,
        comment: json['comment'] as String?,
        userId: json['userId'] as String?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'comment': comment,
        'userId': userId,
        'date': date?.toIso8601String(),
      };

StatusWageEntity toDomain() {
    return StatusWageEntity(
      status: status ?? 'abc',
      comment: comment ?? 'abc',
      userId: userId ?? 'abc',
      date: date ?? DateTime.now(),
    );
  }
}
