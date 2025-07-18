import 'package:service/data/model/communication/inbox_json/inbox_participant_json.dart';
import 'package:service/domain/entities/communication/inbox_entity.dart';

class InboxJson {
  InboxJson({
    required this.id,
    required this.name,
    required this.date,
    required this.participants,
  });

  final String? id;
  final String? name;
  final DateTime? date;
  final List<InboxParticipantJson> participants;

  factory InboxJson.fromJson(Map<String, dynamic> json) {
    return InboxJson(
      id: json["id"],
      name: json["name"],
      date: DateTime.tryParse(json["date"] ?? ""),
      participants: json["participants"] == null
          ? []
          : List<InboxParticipantJson>.from(json["participants"]!
              .map((x) => InboxParticipantJson.fromJson(x))),
    );
  }
  InboxEntity toDomain() {
    return InboxEntity(
      id: id ?? "123",
      name: name ?? "abc",
      date: date ?? DateTime.now(),
      participants: participants.map((e) => e.toDomain()).toList(),
    );
  }
}
