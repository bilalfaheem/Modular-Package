import 'package:collection/collection.dart';

class BusinessUnit {
  String name;
  String title;
  String id;

  BusinessUnit({required this.name, required this.title, required this.id});

  factory BusinessUnit.fromJson(Map<String, dynamic> json) {
    final title = json['title'] as String;
    final name = json['name'] as String;
    final id = json['id'] as String;
    return BusinessUnit(name: name, title: title, id: id);
  }

  Map<String, dynamic> toJson() => {'Title': title, 'name': name, 'id': id};

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BusinessUnit) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => title.hashCode ^ name.hashCode ^ id.hashCode;
}
