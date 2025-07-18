import 'package:collection/collection.dart';
import 'package:service/domain/entities/invoice/invoice_entity.dart';

class Customer {
  String? id;
  String? name;
  String? email;
  String? billingAddress;
  String? billingPreference;

  Customer({
    this.id,
    this.name,
    this.email,
    this.billingAddress,
    this.billingPreference,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json['id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        billingAddress: json['billingAddress'] as String?,
        billingPreference: json['billingPreference'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'billingAddress': billingAddress,
        'billingPreference': billingPreference,
      };

  InvoiceCustomerEntity toDomain() {
    return InvoiceCustomerEntity(
      id: id ?? '123',
      name: name ?? 'name',
      email: email ?? 'email',
      billingAddress: billingAddress ?? 'billingAddress',
      billingPreference: billingPreference ?? 'billingPreference',
    );
  }
}
