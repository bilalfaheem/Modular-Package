import 'package:collection/collection.dart';

class UpdateWageJson {
  String? userMessage;
  bool? status;

  UpdateWageJson({this.userMessage, this.status});

  factory UpdateWageJson.fromJson(Map<String, dynamic> json) => UpdateWageJson(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };
}
