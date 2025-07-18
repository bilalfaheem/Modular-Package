import 'package:collection/collection.dart';


class {{name.pascalCase()}}DataModel {
  String? userMessage;
  bool? status;

  {{name.pascalCase()}}DataModel({this.userMessage, this.status});

  factory {{name.pascalCase()}}DataModel.fromJson(Map<String, dynamic> json) => {{name.pascalCase()}}DataModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! {{name.pascalCase()}}DataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => userMessage.hashCode ^ status.hashCode;
}
