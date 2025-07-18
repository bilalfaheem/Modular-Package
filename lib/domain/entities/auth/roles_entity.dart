class RolesEntity {
  final String module;
  RolesEntity({this.module = "Roles"});

  Map<String, dynamic> toJson() {
    return {'module': module};
  }
}
