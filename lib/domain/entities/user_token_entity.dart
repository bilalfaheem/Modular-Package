class UserTokenEntity {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;

  const UserTokenEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });
}
