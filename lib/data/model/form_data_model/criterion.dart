import 'package:collection/collection.dart';

import 'condition.dart';

class Criterion {
  List<Condition>? conditions;
  String? action;

  Criterion({this.conditions, this.action});

  factory Criterion.fromJson(Map<String, dynamic> json) => Criterion(
        conditions: (json['conditions'] as List<dynamic>?)
            ?.map((e) => Condition.fromJson(e as Map<String, dynamic>))
            .toList(),
        action: json['action'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'conditions': conditions?.map((e) => e.toJson()).toList(),
        'action': action,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Criterion) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => conditions.hashCode ^ action.hashCode;
}
