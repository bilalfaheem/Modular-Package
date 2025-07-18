import 'package:collection/collection.dart';
import 'package:service/domain/entities/invoice/invoice_entity.dart';

class Shift {
  String? name;
  int? rate;
  String? rateType;
  String? fromTime;
  String? toTime;

  Shift({this.name, this.rate, this.rateType, this.fromTime, this.toTime});

  factory Shift.fromJson(Map<String, dynamic> json) => Shift(
        name: json['name'] as String?,
        rate: json['rate'] as int?,
        rateType: json['rateType'] as String?,
        fromTime: json['fromTime'] as String?,
        toTime: json['toTime'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'rate': rate,
        'rateType': rateType,
        'fromTime': fromTime,
        'toTime': toTime,
      };

  ShiftEntity toDomain() {
    return ShiftEntity(
      name: name ?? '',
      rate: rate ?? 0,
      rateType: rateType ?? '',
      fromTime: fromTime ?? '',
      toTime: toTime ?? '',
    );
  }
}
