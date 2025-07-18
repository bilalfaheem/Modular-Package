class {{name.pascalCase()}}Entity {
  final String token;
  final String email;

  {{name.pascalCase()}}Entity({
    required this.token,
    required this.email,
  });

  (String,Map<String, dynamic>) toJson() {
    return (token,{
      'email': email,
    });
  }
}
