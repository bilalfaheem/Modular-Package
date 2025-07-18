class CustomersEntity {
  final String token;

  CustomersEntity({required this.token});

  (String, Map<String, dynamic>) toJson() {
    return (
      token,
      {
        'userTypes': 'Customer',
      }
    );
  }
}
