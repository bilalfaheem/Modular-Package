import 'package:collection/collection.dart';
import 'package:service/domain/entities/invoice/invoice_entity.dart';

import 'shift.dart';

class Service {
  String? serviceId;
  String? serviceName;
  dynamic description;
  Shift? shift;

  Service({this.serviceId, this.serviceName, this.description, this.shift});

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        serviceId: json['serviceId'] as String?,
        serviceName: json['serviceName'] as String?,
        description: json['description'] as dynamic,
        shift: json['shift'] == null
            ? null
            : Shift.fromJson(json['shift'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'serviceId': serviceId,
        'serviceName': serviceName,
        'description': description,
        'shift': shift?.toJson(),
      };

  ServiceEntity toDomain() {
    return ServiceEntity(
      serviceId: serviceId ?? '',
      serviceName: serviceName ?? '',
      description: description?.toString() ?? '',
      shift: shift?.toDomain(),
    );
  }
}
