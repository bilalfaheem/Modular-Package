import 'package:service/domain/entities/invoice/invoice_entity.dart';

import 'invoice_discount.dart';
import 'tax_dto.dart';

class Addon {
  String? id;
  int? quantity;
  int? rate;
  String? discription;
  TaxDto? taxDto;
  InvoiceDiscount? invoiceDiscount;
  String? type;

  Addon({
    this.id,
    this.quantity,
    this.rate,
    this.discription,
    this.taxDto,
    this.invoiceDiscount,
    this.type,
  });

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
        id: json['id'] as String?,
        quantity: json['quantity'] as int?,
        rate: json['rate'] as int?,
        discription: json['discription'] as String?,
        taxDto: json['taxDto'] == null
            ? null
            : TaxDto.fromJson(json['taxDto'] as Map<String, dynamic>),
        invoiceDiscount: json['invoiceDiscount'] == null
            ? null
            : InvoiceDiscount.fromJson(
                json['invoiceDiscount'] as Map<String, dynamic>),
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'rate': rate,
        'discription': discription,
        'taxDto': taxDto?.toJson(),
        'invoiceDiscount': invoiceDiscount?.toJson(),
        'type': type,
      };

  InvoiceAddonEntity toDomain() {
    return InvoiceAddonEntity(
      id: id ?? '123',
      quantity: quantity ?? 0,
      rate: rate ?? 0,
      discription: discription ?? 'discription',
      taxDto: taxDto?.toDomain() ??
          InvoiceTaxDtoEntity(
              id: '123', name: 'name', rate: 0, compoundTax: false),
      invoiceDiscount: invoiceDiscount?.toDomain() ??
          InvoiceDiscountEntity(discountType: 'discountType', discount: 0),
      type: type ?? 'type',
    );
  }
}
