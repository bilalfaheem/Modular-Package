import 'package:collection/collection.dart';
import 'package:service/data/model/invoice/invoice_data_model/item_data/item_data.dart';
import 'package:service/domain/entities/invoice/invoice_entity.dart';

import 'invoice_discount.dart';
import 'tax_dto.dart';

class Item {
  String? id;
  int? quantity;
  int? rate;
  String? discription;
  TaxDto? taxDto;
  InvoiceDiscount? invoiceDiscount;
  String? type;
  ItemData? data;

  Item({
    this.id,
    this.quantity,
    this.rate,
    this.discription,
    this.taxDto,
    this.invoiceDiscount,
    this.type,
    this.data,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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
        data: json['data'] == null
            ? null
            : ItemData.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'rate': rate,
        'discription': discription,
        'taxDto': taxDto?.toJson(),
        'invoiceDiscount': invoiceDiscount?.toJson(),
        'type': type,
        'data': data?.toJson(),
      };

  InvoiceItemEntity toDomain() {
    return InvoiceItemEntity(
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
        data: data?.toDomain() ?? ItemDataEntity(timeSheet: []));
  }
}
