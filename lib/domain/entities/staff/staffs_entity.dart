class StaffsEntity {
  final String token;

  StaffsEntity({required this.token});

  (String, Map<String, dynamic>) toJson() {
    return (
      token,
      {
        'userTypes': 'Provider',
      }
    );
  }
}
