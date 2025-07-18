import 'package:service/domain/entities/communication/message_entity.dart';

class SenderJson {
  SenderJson({
    required this.id,
    required this.name,
    required this.profileUrl,
  });

  final String? id;
  final String? name;
  final dynamic profileUrl;

  factory SenderJson.fromJson(Map<String, dynamic> json) {
    return SenderJson(
      id: json["id"],
      name: json["name"],
      profileUrl: json["profileUrl"],
    );
  }

  SenderEntity toDomain() {
    return SenderEntity(
      id: id ?? "",
      name: name ?? "",
      profileUrl: profileUrl ?? "",
    );
  }
}
