import 'package:collection/collection.dart';

class UpdateInvoiceDataModel {
  String? userMessage;
  bool? status;

  UpdateInvoiceDataModel({this.userMessage, this.status});

  factory UpdateInvoiceDataModel.fromJson(Map<String, dynamic> json) =>
      UpdateInvoiceDataModel(
        userMessage: json['userMessage'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userMessage': userMessage,
        'status': status,
      };
}
