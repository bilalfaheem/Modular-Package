class InvoiceEntity {
  final String id;
  final String invoiceNumber;
  final InvoiceCustomerEntity customer;
  final String name;
  final DateTime date;
  final DateTime dueDate;
  final int amount;
  final int taxes;
  final List<InvoiceItemEntity> items;
  final List<InvoiceAddonEntity> addons;
  final String note;
  final String termsAndConditions;
  final int discount;
  final int balance;
  final int subTotal;
  final int total;
  final InvoiceStatusEntity status;

  InvoiceEntity({
    required this.id,
    required this.invoiceNumber,
    required this.customer,
    required this.name,
    required this.date,
    required this.dueDate,
    required this.amount,
    required this.taxes,
    required this.items,
    required this.addons,
    required this.note,
    required this.termsAndConditions,
    required this.discount,
    required this.balance,
    required this.subTotal,
    required this.total,
    required this.status,
  });

  InvoiceEntity copyWith({
    String? id,
    String? invoiceNumber,
    InvoiceCustomerEntity? customer,
    String? name,
    DateTime? date,
    DateTime? dueDate,
    int? amount,
    int? taxes,
    List<InvoiceItemEntity>? items,
    List<InvoiceAddonEntity>? addons,
    String? note,
    String? termsAndConditions,
    int? discount,
    int? balance,
    int? subTotal,
    int? total,
    InvoiceStatusEntity? status,
  }) {
    return InvoiceEntity(
      id: id ?? this.id,
      invoiceNumber: invoiceNumber ?? this.invoiceNumber,
      customer: customer ?? this.customer.copyWith(), // Ensure immutability
      name: name ?? this.name,
      date: date ?? this.date,
      dueDate: dueDate ?? this.dueDate,
      amount: amount ?? this.amount,
      taxes: taxes ?? this.taxes,
      items: items ?? this.items.map((e) => e.copyWith()).toList(),
      addons: addons ?? this.addons.map((e) => e.copyWith()).toList(),
      note: note ?? this.note,
      termsAndConditions: termsAndConditions ?? this.termsAndConditions,
      discount: discount ?? this.discount,
      balance: balance ?? this.balance,
      subTotal: subTotal ?? this.subTotal,
      total: total ?? this.total,
      status: status ?? this.status.copyWith(),
    );
  }
}

class InvoiceCustomerEntity {
  final String id;
  final String name;
  final String email;
  final String billingAddress;
  final String billingPreference;

  InvoiceCustomerEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.billingAddress,
    required this.billingPreference,
  });

  InvoiceCustomerEntity copyWith({
    String? id,
    String? name,
    String? email,
    String? billingAddress,
    String? billingPreference,
  }) {
    return InvoiceCustomerEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      billingAddress: billingAddress ?? this.billingAddress,
      billingPreference: billingPreference ?? this.billingPreference,
    );
  }
}

class InvoiceItemEntity {
  final String id;
  final int quantity;
  final int rate;
  final String discription;
  final InvoiceTaxDtoEntity taxDto;
  final InvoiceDiscountEntity invoiceDiscount;
  final String type;
  final ItemDataEntity data;

  InvoiceItemEntity(
      {required this.id,
      required this.quantity,
      required this.rate,
      required this.discription,
      required this.taxDto,
      required this.invoiceDiscount,
      required this.type,
      required this.data});

  InvoiceItemEntity copyWith(
      {String? id,
      int? quantity,
      int? rate,
      String? discription,
      InvoiceTaxDtoEntity? taxDto,
      InvoiceDiscountEntity? invoiceDiscount,
      String? type,
      ItemDataEntity? data}) {
    return InvoiceItemEntity(
        id: id ?? this.id,
        quantity: quantity ?? this.quantity,
        rate: rate ?? this.rate,
        discription: discription ?? this.discription,
        taxDto: taxDto ?? this.taxDto.copyWith(),
        invoiceDiscount: invoiceDiscount ?? this.invoiceDiscount.copyWith(),
        type: type ?? this.type,
        data: data ?? this.data);
  }
}

class InvoiceTaxDtoEntity {
  final String id;
  final String name;
  final int rate;
  final bool compoundTax;

  InvoiceTaxDtoEntity({
    required this.id,
    required this.name,
    required this.rate,
    required this.compoundTax,
  });

  InvoiceTaxDtoEntity copyWith({
    String? id,
    String? name,
    int? rate,
    bool? compoundTax,
  }) {
    return InvoiceTaxDtoEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      rate: rate ?? this.rate,
      compoundTax: compoundTax ?? this.compoundTax,
    );
  }
}

class InvoiceDiscountEntity {
  final String discountType;
  final int discount;

  InvoiceDiscountEntity({
    required this.discountType,
    required this.discount,
  });

  InvoiceDiscountEntity copyWith({
    String? discountType,
    int? discount,
  }) {
    return InvoiceDiscountEntity(
      discountType: discountType ?? this.discountType,
      discount: discount ?? this.discount,
    );
  }
}

class InvoiceStatusEntity {
  final String status;
  final String comment;
  final String userId;
  final DateTime date;

  InvoiceStatusEntity({
    required this.status,
    required this.comment,
    required this.userId,
    required this.date,
  });

  InvoiceStatusEntity copyWith({
    String? status,
    String? comment,
    String? userId,
    DateTime? date,
  }) {
    return InvoiceStatusEntity(
      status: status ?? this.status,
      comment: comment ?? this.comment,
      userId: userId ?? this.userId,
      date: date ?? this.date,
    );
  }
}

class InvoiceAddonEntity {
  final String id;
  final int quantity;
  final int rate;
  final String discription;
  final InvoiceTaxDtoEntity taxDto;
  final InvoiceDiscountEntity invoiceDiscount;
  final String type;

  InvoiceAddonEntity({
    required this.id,
    required this.quantity,
    required this.rate,
    required this.discription,
    required this.taxDto,
    required this.invoiceDiscount,
    required this.type,
  });

  InvoiceAddonEntity copyWith({
    String? id,
    int? quantity,
    int? rate,
    String? discription,
    InvoiceTaxDtoEntity? taxDto,
    InvoiceDiscountEntity? invoiceDiscount,
    String? type,
  }) {
    return InvoiceAddonEntity(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      rate: rate ?? this.rate,
      discription: discription ?? this.discription,
      taxDto: taxDto ?? this.taxDto.copyWith(),
      invoiceDiscount: invoiceDiscount ?? this.invoiceDiscount.copyWith(),
      type: type ?? this.type,
    );
  }
}

class ItemDataEntity {
  final List<TimeSheetEntity> timeSheet;

  ItemDataEntity({required this.timeSheet});

  ItemDataEntity copyWith({List<TimeSheetEntity>? timeSheet}) {
    return ItemDataEntity(
      timeSheet: timeSheet ?? this.timeSheet,
    );
  }
}

class InvoiceCustomersEntity {
  final String id;
  final String name;
  final double rate;
  final bool isInvoiceGenerated;
  final bool isPaid;
  final bool isApproved;
  final bool isEmailSent;

  InvoiceCustomersEntity({
    required this.id,
    required this.name,
    required this.rate,
    required this.isInvoiceGenerated,
    required this.isPaid,
    required this.isApproved,
    required this.isEmailSent,
  });

  InvoiceCustomersEntity copyWith({
    String? id,
    String? name,
    double? rate,
    bool? isInvoiceGenerated,
    bool? isPaid,
    bool? isApproved,
    bool? isEmailSent,
  }) {
    return InvoiceCustomersEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      rate: rate ?? this.rate,
      isInvoiceGenerated: isInvoiceGenerated ?? this.isInvoiceGenerated,
      isPaid: isPaid ?? this.isPaid,
      isApproved: isApproved ?? this.isApproved,
      isEmailSent: isEmailSent ?? this.isEmailSent,
    );
  }
}

class ProviderEntity {
  final String id;
  final String name;
  final int rate;
  final bool isPaySlipGenerated;
  final bool isPaid;
  final bool isApproved;
  final bool isEmailSent;

  ProviderEntity({
    required this.id,
    required this.name,
    required this.rate,
    required this.isPaySlipGenerated,
    required this.isPaid,
    required this.isApproved,
    required this.isEmailSent,
  });

  ProviderEntity copyWith({
    String? id,
    String? name,
    int? rate,
    bool? isPaySlipGenerated,
    bool? isPaid,
    bool? isApproved,
    bool? isEmailSent,
  }) {
    return ProviderEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      rate: rate ?? this.rate,
      isPaySlipGenerated: isPaySlipGenerated ?? this.isPaySlipGenerated,
      isPaid: isPaid ?? this.isPaid,
      isApproved: isApproved ?? this.isApproved,
      isEmailSent: isEmailSent ?? this.isEmailSent,
    );
  }
}

class ServiceEntity {
  final String serviceId;
  final String serviceName;
  final String description;
  final ShiftEntity? shift;

  ServiceEntity({
    required this.serviceId,
    required this.serviceName,
    required this.description,
    required this.shift,
  });

  ServiceEntity copyWith({
    String? serviceId,
    String? serviceName,
    String? description,
    ShiftEntity? shift,
  }) {
    return ServiceEntity(
      serviceId: serviceId ?? this.serviceId,
      serviceName: serviceName ?? this.serviceName,
      description: description ?? this.description,
      shift: shift ?? this.shift,
    );
  }
}

class ShiftEntity {
  final String name;
  final int rate;
  final String rateType;
  final String fromTime;
  final String toTime;

  ShiftEntity({
    required this.name,
    required this.rate,
    required this.rateType,
    required this.fromTime,
    required this.toTime,
  });

  ShiftEntity copyWith({
    String? name,
    int? rate,
    String? rateType,
    String? fromTime,
    String? toTime,
  }) {
    return ShiftEntity(
      name: name ?? this.name,
      rate: rate ?? this.rate,
      rateType: rateType ?? this.rateType,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
    );
  }
}

class TimeSheetEntity {
  final String bookingId;
  final DateTime fromTime;
  final DateTime toTime;
  final InvoiceCustomersEntity? customer;
  final ProviderEntity? provider;
  final ServiceEntity? service;
  final int surchargeHours;
  final int surchargeRate;

  TimeSheetEntity({
    required this.bookingId,
    required this.fromTime,
    required this.toTime,
    required this.customer,
    required this.provider,
    required this.service,
    required this.surchargeHours,
    required this.surchargeRate,
  });

  TimeSheetEntity copyWith({
    String? bookingId,
    DateTime? fromTime,
    DateTime? toTime,
    InvoiceCustomersEntity? customer,
    ProviderEntity? provider,
    ServiceEntity? service,
    int? surchargeHours,
    int? surchargeRate,
  }) {
    return TimeSheetEntity(
      bookingId: bookingId ?? this.bookingId,
      fromTime: fromTime ?? this.fromTime,
      toTime: toTime ?? this.toTime,
      customer: customer ?? this.customer,
      provider: provider ?? this.provider,
      service: service ?? this.service,
      surchargeHours: surchargeHours ?? this.surchargeHours,
      surchargeRate: surchargeRate ?? this.surchargeRate,
    );
  }
}
