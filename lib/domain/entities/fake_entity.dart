class FakeEntity {
  final String email;
  final String password;

  FakeEntity({required this.email, required this.password});

  factory FakeEntity.fromJson(Map<String, dynamic> json) => FakeEntity(
        email: json['email'] ?? "",
        password: json['password'] ?? "",
      );

  Map<String, String> toJson() {
    return {'email': email, 'password': password};
  }
}
