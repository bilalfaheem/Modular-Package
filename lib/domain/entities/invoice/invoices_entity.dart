import 'package:service/domain/entities/invoice/invoice_status.dart';
import 'package:equatable/equatable.dart';

class InvoicesEntity extends Equatable {
  final String token;
  final String? customerId;
  final int pageNo, pageSize;
  final InvoiceStatus status;
  final DateTime? fromDate, toDate;

  InvoicesEntity({
    required this.token,
    required this.pageNo,
    required this.pageSize,
    this.customerId,
    this.fromDate,
    this.toDate,
    required this.status,
  });

  (String, Map<String, dynamic>) toJson() {
    final Map<String, dynamic> data = {
      'customerId': customerId,
      'pageNo': pageNo.toString(),
      'pageSize': pageSize.toString(),
      'status': status.name,
      'fromDate': fromDate?.toUtc().toIso8601String(),
      'toDate': toDate?.toUtc().toIso8601String(),
    };

    data.removeWhere((key, value) => value == null || value == "All");
    return (token, data);
  }

  const InvoicesEntity.empty()
      : token = '123',
        pageNo = 1,
        pageSize = 20,
        customerId = null,
        fromDate = null,
        toDate = null,
        status = InvoiceStatus.All;

  InvoicesEntity copyWith({
    String? token,
    String? customerId,
    int? pageNo,
    int? pageSize,
    InvoiceStatus? status,
    DateTime? fromDate,
    DateTime? toDate,
  }) {
    return InvoicesEntity(
      token: token ?? this.token,
      customerId: customerId ?? this.customerId,
      pageNo: pageNo ?? this.pageNo,
      pageSize: pageSize ?? this.pageSize,
      status: status ?? this.status,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
    );
  }

  @override
  List<Object?> get props =>
      [token, customerId, pageNo, pageSize, status, fromDate, toDate];
}
