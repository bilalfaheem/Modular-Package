import 'package:equatable/equatable.dart';
import 'package:service/domain/entities/wage/wage_status.dart';

class WagesEntity extends Equatable {
  final String token;
  final String? staffId;
  final int pageNo, pageSize;
  final WageStatus status;
  final DateTime? fromDate, toDate;

  const WagesEntity({
    required this.token,
    required this.pageNo,
    required this.pageSize,
    this.staffId,
    this.fromDate,
    this.toDate,
    required this.status,
  });

  (String, Map<String, dynamic>) toJson() {
    final Map<String, dynamic> data = {
      'staffId': staffId,
      'pageNo': pageNo.toString(),
      'pageSize': pageSize.toString(),
      'status': status.name,
      'fromDate': fromDate?.toUtc().toIso8601String(),
      'toDate': toDate?.toUtc().toIso8601String(),
    };

    data.removeWhere((key, value) => value == null || value == "All");
    return (token, data);
  }

  const WagesEntity.empty()
      : token = '123',
        pageNo = 1,
        pageSize = 20,
        staffId = null,
        fromDate = null,
        toDate = null,
        status = WageStatus.All;

  WagesEntity copyWith({
    String? token,
    String? staffId,
    int? pageNo,
    int? pageSize,
    WageStatus? status,
    DateTime? fromDate,
    DateTime? toDate,
  }) {
    return WagesEntity(
      token: token ?? this.token,
      staffId: staffId ?? this.staffId,
      pageNo: pageNo ?? this.pageNo,
      pageSize: pageSize ?? this.pageSize,
      status: status ?? this.status,
      fromDate: fromDate ?? this.fromDate,
      toDate: toDate ?? this.toDate,
    );
  }

  @override
  List<Object?> get props =>
      [token, staffId, pageNo, pageSize, status, fromDate, toDate];
}
