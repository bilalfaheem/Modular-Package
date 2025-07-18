class {{name.pascalCase()}}Entity {
  final String email;

  {{name.pascalCase()}}Entity({
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
