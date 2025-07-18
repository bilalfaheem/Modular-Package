class ForgotPasswordEntity {
  final String email;

  ForgotPasswordEntity({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
