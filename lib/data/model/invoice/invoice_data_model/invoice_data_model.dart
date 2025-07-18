import 'package:service/domain/entities/invoice/invoice_entity.dart';

import 'addon.dart';
import 'customer.dart';
import 'item.dart';
import 'status.dart';

class InvoiceJson {
  String? id;
  String? invoiceNumber;
  Customer? customer;
  String? name;
  DateTime? date;
  DateTime? dueDate;
  int? amount;
  int? taxes;
  List<Item>? items;
  List<Addon>? addons;
  String? note;
  String? termsAndConditions;
  int? discount;
  int? balance;
  int? subTotal;
  int? total;
  Status? status;

  InvoiceJson({
    this.id,
    this.invoiceNumber,
    this.customer,
    this.name,
    this.date,
    this.dueDate,
    this.amount,
    this.taxes,
    this.items,
    this.addons,
    this.note,
    this.termsAndConditions,
    this.discount,
    this.balance,
    this.subTotal,
    this.total,
    this.status,
  });

  factory InvoiceJson.fromJson(Map<String, dynamic> json) {
    return InvoiceJson(
      id: json['id'] as String?,
      invoiceNumber: json['invoiceNumber'] as String?,
      customer: json['customer'] == null ? null : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      name: json['name'] as String?,
      date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
      dueDate: json['dueDate'] == null ? null : DateTime.parse(json['dueDate'] as String),
      amount: json['amount'] as int?,
      taxes: json['taxes'] as int?,
      items: (json['items'] as List<dynamic>?)?.map((e) => Item.fromJson(e as Map<String, dynamic>)).toList(),
      addons: (json['addons'] as List<dynamic>?)?.map((e) => Addon.fromJson(e as Map<String, dynamic>)).toList(),
      note: json['note'] as String?,
      termsAndConditions: json['termsAndConditions'] as String?,
      discount: json['discount'] as int?,
      balance: json['balance'] as int?,
      subTotal: json['subTotal'] as int?,
      total: json['total'] as int?,
      status: json['status'] == null ? null : Status.fromJson(json['status'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'invoiceNumber': invoiceNumber,
        'customer': customer?.toJson(),
        'name': name,
        'date': date?.toIso8601String(),
        'dueDate': dueDate?.toIso8601String(),
        'amount': amount,
        'taxes': taxes,
        'items': items?.map((e) => e.toJson()).toList(),
        'addons': addons?.map((e) => e.toJson()).toList(),
        'note': note,
        'termsAndConditions': termsAndConditions,
        'discount': discount,
        'balance': balance,
        'subTotal': subTotal,
        'total': total,
        'status': status?.toJson(),
      };

  InvoiceEntity toDomain() {
    return InvoiceEntity(
      id: id ?? '123',
      invoiceNumber: invoiceNumber ?? 'invoiceNumber',
      customer: customer?.toDomain() ??
          InvoiceCustomerEntity(id: '123', name: 'name', email: 'email', billingAddress: 'billingAddress', billingPreference: 'billingPreference'),
      name: name ?? 'name',
      date: date ?? DateTime.now(),
      dueDate: dueDate ?? DateTime.now(),
      amount: amount ?? 0,
      taxes: taxes ?? 0,
      items: items?.map((e) => e.toDomain()).toList() ?? [],
      addons: addons?.map((e) => e.toDomain()).toList() ?? [],
      note: note ?? 'note',
      termsAndConditions: termsAndConditions ?? 'termsAndConditions',
      discount: discount ?? 0,
      balance: balance ?? 0,
      subTotal: subTotal ?? 0,
      total: total ?? 0,
      status: status?.toDomain() ?? InvoiceStatusEntity(status: 'status', comment: 'comment', userId: 'userId', date: DateTime.now()),
    );
  }
}
