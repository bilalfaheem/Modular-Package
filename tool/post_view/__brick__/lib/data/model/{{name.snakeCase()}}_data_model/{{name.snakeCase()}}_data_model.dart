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

}
