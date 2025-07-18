import 'package:service/domain/entities/communication/inbox_entity.dart';

class InboxParticipantJson {
  InboxParticipantJson({
    required this.id,
    required this.name,
    required this.profileUrl,
  });

  final String? id;
  final String? name;
  final String? profileUrl;

  factory InboxParticipantJson.fromJson(Map<String, dynamic> json) {
    return InboxParticipantJson(
      id: json["id"],
      name: json["name"],
      profileUrl: json["profileUrl"],
    );
  }
  InboxParticipantEntity toDomain() {
    return InboxParticipantEntity(
      id: id ?? "123",
      name: name ?? "abc",
      profileUrl: profileUrl ?? "abc",
    );
  }
}
