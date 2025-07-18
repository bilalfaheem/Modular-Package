class FormsEntity {
  final List<String> ids;

  FormsEntity({
    required this.ids,
  });

  Map<String, dynamic> toJson() {
    return {'PageNo': "1", 'PageSize': "10", 'ids': ids};
  }
}
