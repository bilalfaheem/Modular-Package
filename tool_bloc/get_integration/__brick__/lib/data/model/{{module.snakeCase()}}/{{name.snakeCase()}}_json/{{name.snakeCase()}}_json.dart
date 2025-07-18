import 'package:collection/collection.dart';


class {{name.pascalCase()}}Json {
  String? userMessage;
  bool? status;

  {{name.pascalCase()}}Json({this.userMessage, this.status});

  factory {{name.pascalCase()}}Json.fromJson(Map<String, dynamic> json) => {{name.pascalCase()}}Json(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

}
