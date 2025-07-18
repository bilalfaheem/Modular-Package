class GetInboxEntity {
  final String token;
  final String userId;

  GetInboxEntity({
    required this.token,
    required this.userId,
  });

  (String, Map<String, dynamic>) toJson() {
    return (
      token,
      {
        'UserId': userId,
      }
    );
  }
}
