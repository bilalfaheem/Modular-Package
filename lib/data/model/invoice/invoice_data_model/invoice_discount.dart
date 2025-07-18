import 'package:collection/collection.dart';
import 'package:service/domain/entities/invoice/invoice_entity.dart';

class InvoiceDiscount {
  String? discountType;
  int? discount;

  InvoiceDiscount({this.discountType, this.discount});

  factory InvoiceDiscount.fromJson(Map<String, dynamic> json) {
    return InvoiceDiscount(
      discountType: json['discountType'] as String?,
      discount: json['discount'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'discountType': discountType,
        'discount': discount,
      };

  InvoiceDiscountEntity toDomain() {
    return InvoiceDiscountEntity(
      discountType: discountType ?? 'discountType',
      discount: discount ?? 0,
    );
  }
}
