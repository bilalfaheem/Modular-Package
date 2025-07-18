class LoginEntity {
  final String userName, password;

  LoginEntity({required this.userName, required this.password});

  Map<String, dynamic> toJson() {
    return {'userName': userName, 'password': password};
  }
}
