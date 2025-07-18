import 'package:collection/collection.dart';
import 'package:service/domain/entities/wage/wage_entity.dart';

class Deduction {
  String? description;
  int? amount;

  Deduction({this.description, this.amount});

  factory Deduction.fromJson(Map<String, dynamic> json) => Deduction(
        description: json['description'] as String?,
        amount: json['amount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'amount': amount,
      };

DeductionEntityWageEntity toDomain() {
    return DeductionEntityWageEntity(
      description: description ?? 'abc',
      amount: amount ?? 0,
    );
  }
}
