import 'package:collection/collection.dart';
import 'package:service/domain/entities/wage/wage_entity.dart';

class Provider {
  String? id;
  String? name;
  String? profileUrl;

  Provider({this.id, this.name, this.profileUrl});

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json['id'] as String?,
        name: json['name'] as String?,
        profileUrl: json['profileUrl'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'profileUrl': profileUrl,
      };
ProviderWageEntity toDomain() {
    return ProviderWageEntity(
      id: id ?? '123',
      name: name ?? 'abc',
      profileUrl: profileUrl ?? 'abc',
    );
  }
}
