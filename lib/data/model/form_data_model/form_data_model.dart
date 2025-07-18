import 'package:collection/collection.dart';
import 'package:service/data/model/form_data_model/condition.dart';
import 'package:service/data/model/form_data_model/criterion.dart';
import 'package:service/data/model/form_data_model/form_datum.dart';

class FormDataModel {
  List<FormDatum>? data;

  FormDataModel({this.data});

  factory FormDataModel.fromJson(Map<String, dynamic> json) {
    return FormDataModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => FormDatum.fromJson(e as Map<String, dynamic>))
            .toList());
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FormDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => data.hashCode;

  List<String> toDomain() {
    List<String> ids = [];

    for (FormDatum reg in data ?? []) {
      if (reg.formBuilderData?.name != 'Business Unit') {
        for (Criterion c in reg.criteria ?? []) {
          if (c.action?.contains('View') == true) {
            for (Condition cond in c.conditions ?? []) {
              if (cond.fieldName == "name" && cond.value == "Customer") {
                ids.add(reg.formBuilderData?.formBuilderId ?? "");
              }
            }
          }
        }
      }
    }

    return ids;
  }
}
