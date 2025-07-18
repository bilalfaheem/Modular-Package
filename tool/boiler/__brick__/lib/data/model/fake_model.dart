
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

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! FakeModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => message.hashCode ^ status.hashCode;
}
