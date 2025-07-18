import 'package:collection/collection.dart';

import 'criterion.dart';
import 'form_builder_data.dart';

class FormDatum {
  String? id;
  String? module;
  FormBuilderData? formBuilderData;
  List<Criterion>? criteria;

  FormDatum({this.id, this.module, this.formBuilderData, this.criteria});

  factory FormDatum.fromJson(Map<String, dynamic> json) => FormDatum(
        id: json['id'] as String?,
        module: json['module'] as String?,
        formBuilderData: json['formBuilderData'] == null
            ? null
            : FormBuilderData.fromJson(
                json['formBuilderData'] as Map<String, dynamic>),
        criteria: (json['criteria'] as List<dynamic>?)
            ?.map((e) => Criterion.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'module': module,
        'formBuilderData': formBuilderData?.toJson(),
        'criteria': criteria?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FormDatum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      module.hashCode ^
      formBuilderData.hashCode ^
      criteria.hashCode;
}
