import 'package:collection/collection.dart';


class ChatJson {
  String? userMessage;
  bool? status;

  ChatJson({this.userMessage, this.status});

  factory ChatJson.fromJson(Map<String, dynamic> json) => ChatJson(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };

}
