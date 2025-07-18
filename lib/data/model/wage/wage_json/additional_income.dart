import 'package:collection/collection.dart';
import 'package:service/domain/entities/wage/wage_entity.dart';

class AdditionalIncome {
  String? description;
  int? amount;

  AdditionalIncome({this.description, this.amount});

  factory AdditionalIncome.fromJson(Map<String, dynamic> json) {
    return AdditionalIncome(
      description: json['description'] as String?,
      amount: json['amount'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'description': description,
        'amount': amount,
      };

AdditionalIncomeEntityWageEntity toDomain() {
    return AdditionalIncomeEntityWageEntity(
      description: description ?? 'abc',
      amount: amount ?? 0,
    );
  }
}
