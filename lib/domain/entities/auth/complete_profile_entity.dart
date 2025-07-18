class CompleteProfileEntity {
  final String email;

  CompleteProfileEntity({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
