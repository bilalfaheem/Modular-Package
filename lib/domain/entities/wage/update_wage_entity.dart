class UpdateWageEntity {
  final String token;

  final String invoiceId, status, comment;

  UpdateWageEntity({
    required this.token,
    required this.invoiceId,
    required this.status,
    this.comment = '',
  });

  (String, Map<String, dynamic>, String) toJson() {
    Map<String, dynamic> data = {
      'status': status,
      'comment': comment,
    };
    data.removeWhere((key, val) => val == '');
    return (token, data, invoiceId);
  }
}
