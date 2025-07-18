class FakeModel {
  String? message;
  bool? status;

  FakeModel({this.message, this.status});

  factory FakeModel.fromJson(Map<String, dynamic> json) => FakeModel(
        message: json['message'] as String?,
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'status': status,
      };
}
