import 'package:collection/collection.dart';
import 'package:service/domain/entities/invoice/invoice_entity.dart';

class Customer {
  String? id;
  String? name;
  double? rate;
  bool? isInvoiceGenerated;
  bool? isPaid;
  bool? isApproved;
  bool? isEmailSent;

  Customer({
    this.id,
    this.name,
    this.rate,
    this.isInvoiceGenerated,
    this.isPaid,
    this.isApproved,
    this.isEmailSent,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json['id'] as String?,
        name: json['name'] as String?,
        rate: (json['rate'] as num?)?.toDouble(),
        isInvoiceGenerated: json['isInvoiceGenerated'] as bool?,
        isPaid: json['isPaid'] as bool?,
        isApproved: json['isApproved'] as bool?,
        isEmailSent: json['isEmailSent'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'rate': rate,
        'isInvoiceGenerated': isInvoiceGenerated,
        'isPaid': isPaid,
        'isApproved': isApproved,
        'isEmailSent': isEmailSent,
      };

  InvoiceCustomersEntity toDomain() {
    return InvoiceCustomersEntity(
      id: id ?? '',
      name: name ?? '',
      rate: rate ?? 0.0,
      isInvoiceGenerated: isInvoiceGenerated ?? false,
      isPaid: isPaid ?? false,
      isApproved: isApproved ?? false,
      isEmailSent: isEmailSent ?? false,
    );
  }
}
