import 'package:collection/collection.dart';

class Condition {
  String? fieldName;
  String? operator;
  String? value;
  String? logic;

  Condition({this.fieldName, this.operator, this.value, this.logic});

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        fieldName: json['fieldName'] as String?,
        operator: json['operator'] as String?,
        value: json['value'] as String?,
        logic: json['logic'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'fieldName': fieldName,
        'operator': operator,
        'value': value,
        'logic': logic,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Condition) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      fieldName.hashCode ^ operator.hashCode ^ value.hashCode ^ logic.hashCode;
}
