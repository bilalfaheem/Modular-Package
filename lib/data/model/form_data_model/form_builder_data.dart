import 'package:collection/collection.dart';

class FormBuilderData {
  String? formBuilderId;
  String? name;

  FormBuilderData({this.formBuilderId, this.name});

  factory FormBuilderData.fromJson(Map<String, dynamic> json) {
    return FormBuilderData(
      formBuilderId: json['formBuilderId'] as String?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'formBuilderId': formBuilderId,
        'name': name,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FormBuilderData) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => formBuilderId.hashCode ^ name.hashCode;
}
