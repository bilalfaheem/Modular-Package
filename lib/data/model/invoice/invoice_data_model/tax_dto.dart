import 'package:collection/collection.dart';
import 'package:service/domain/entities/invoice/invoice_entity.dart';

class TaxDto {
  String? id;
  String? name;
  int? rate;
  bool? compoundTax;

  TaxDto({this.id, this.name, this.rate, this.compoundTax});

  factory TaxDto.fromJson(Map<String, dynamic> json) => TaxDto(
        id: json['id'] as String?,
        name: json['name'] as String?,
        rate: json['rate'] as int?,
        compoundTax: json['compoundTax'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'rate': rate,
        'compoundTax': compoundTax,
      };

  InvoiceTaxDtoEntity toDomain() {
    return InvoiceTaxDtoEntity(
      id: id ?? '123',
      name: name ?? 'name',
      rate: rate ?? 0,
      compoundTax: compoundTax ?? false,
    );
  }
}
