class ChangePasswordEntity {
  final String currentPassword, newPassword, confirmPassword;

  ChangePasswordEntity({
    required this.currentPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'currentPassword': currentPassword,
      'newPassword': newPassword,
    };
  }
}
