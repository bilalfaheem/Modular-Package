import 'package:service/domain/entities/wage/wage_entity.dart';

import 'additional_income.dart';
import 'deduction.dart';
import 'provider.dart';
import 'status.dart';

class WageJson {
  String? id;
  String? name;
  List<AdditionalIncome>? additionalIncomes;
  Status? status;
  DateTime? date;
  List<Deduction>? deductions;
  Provider? provider;

  WageJson({
    this.id,
    this.name,
    this.additionalIncomes,
    this.status,
    this.date,
    this.deductions,
    this.provider,
  });

  factory WageJson.fromJson(Map<String, dynamic> json) => WageJson(
        id: json['id'] as String?,
        name: json['name'] as String?,
        additionalIncomes: (json['additionalIncomes'] as List<dynamic>?)?.map((e) => AdditionalIncome.fromJson(e as Map<String, dynamic>)).toList(),
        status: json['status'] == null ? null : Status.fromJson(json['status'] as Map<String, dynamic>),
        date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
        deductions: (json['deductions'] as List<dynamic>?)?.map((e) => Deduction.fromJson(e as Map<String, dynamic>)).toList(),
        provider: json['provider'] == null ? null : Provider.fromJson(json['provider'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'additionalIncomes': additionalIncomes?.map((e) => e.toJson()).toList(),
        'status': status?.toJson(),
        'date': date?.toIso8601String(),
        'deductions': deductions?.map((e) => e.toJson()).toList(),
        'provider': provider?.toJson(),
      };

  WageEntity toDomain() {
    return WageEntity(
      id: id ?? '123',
      name: name ?? 'abc',
      additionalIncomes: additionalIncomes?.map((e) => e.toDomain()).toList() ?? [],
      status: status?.toDomain() ?? StatusWageEntity(status: 'status', comment: 'comment', userId: '123', date: DateTime.now()),
      date: DateTime.now(),
      deductions: deductions?.map((e) => e.toDomain()).toList() ?? [],
      provider: provider?.toDomain() ?? ProviderWageEntity(id: '123', name: "abc", profileUrl: 'ads'),
    );
  }
}
