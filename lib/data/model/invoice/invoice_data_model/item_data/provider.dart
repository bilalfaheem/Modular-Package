import 'package:collection/collection.dart';
import 'package:service/domain/entities/invoice/invoice_entity.dart';

class Provider {
  String? id;
  String? name;
  int? rate;
  bool? isPaySlipGenerated;
  bool? isPaid;
  bool? isApproved;
  bool? isEmailSent;

  Provider({
    this.id,
    this.name,
    this.rate,
    this.isPaySlipGenerated,
    this.isPaid,
    this.isApproved,
    this.isEmailSent,
  });

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json['id'] as String?,
        name: json['name'] as String?,
        rate: json['rate'] as int?,
        isPaySlipGenerated: json['isPaySlipGenerated'] as bool?,
        isPaid: json['isPaid'] as bool?,
        isApproved: json['isApproved'] as bool?,
        isEmailSent: json['isEmailSent'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'rate': rate,
        'isPaySlipGenerated': isPaySlipGenerated,
        'isPaid': isPaid,
        'isApproved': isApproved,
        'isEmailSent': isEmailSent,
      };

  ProviderEntity toDomain() {
    return ProviderEntity(
      id: id ?? '',
      name: name ?? '',
      rate: rate ?? 0,
      isPaySlipGenerated: isPaySlipGenerated ?? false,
      isPaid: isPaid ?? false,
      isApproved: isApproved ?? false,
      isEmailSent: isEmailSent ?? false,
    );
  }
}
