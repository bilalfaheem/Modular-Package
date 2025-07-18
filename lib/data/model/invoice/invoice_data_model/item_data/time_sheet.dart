import 'package:collection/collection.dart';
import 'package:service/domain/entities/invoice/invoice_entity.dart';

import 'customer.dart';
import 'provider.dart';
import 'service.dart';

class TimeSheet {
  String? bookingId;
  DateTime? fromTime;
  DateTime? toTime;
  Customer? customer;
  Provider? provider;
  Service? service;
  int? surchargeHours;
  int? surchargeRate;

  TimeSheet({
    this.bookingId,
    this.fromTime,
    this.toTime,
    this.customer,
    this.provider,
    this.service,
    this.surchargeHours,
    this.surchargeRate,
  });

  factory TimeSheet.fromJson(Map<String, dynamic> json) => TimeSheet(
        bookingId: json['bookingId'] as String?,
        fromTime: json['fromTime'] == null
            ? null
            : DateTime.parse(json['fromTime'] as String),
        toTime: json['toTime'] == null
            ? null
            : DateTime.parse(json['toTime'] as String),
        customer: json['customer'] == null
            ? null
            : Customer.fromJson(json['customer'] as Map<String, dynamic>),
        provider: json['provider'] == null
            ? null
            : Provider.fromJson(json['provider'] as Map<String, dynamic>),
        service: json['service'] == null
            ? null
            : Service.fromJson(json['service'] as Map<String, dynamic>),
        surchargeHours: json['surchargeHours'] as int?,
        surchargeRate: json['surchargeRate'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'bookingId': bookingId,
        'fromTime': fromTime?.toIso8601String(),
        'toTime': toTime?.toIso8601String(),
        'customer': customer?.toJson(),
        'provider': provider?.toJson(),
        'service': service?.toJson(),
        'surchargeHours': surchargeHours,
        'surchargeRate': surchargeRate,
      };

  TimeSheetEntity toDomain() {
    return TimeSheetEntity(
      bookingId: bookingId ?? '',
      fromTime: fromTime ?? DateTime(1970, 1, 1),
      toTime: toTime ?? DateTime(1970, 1, 1),
      customer: customer?.toDomain(),
      provider: provider?.toDomain(),
      service: service?.toDomain(),
      surchargeHours: surchargeHours ?? 0,
      surchargeRate: surchargeRate ?? 0,
    );
  }
}
