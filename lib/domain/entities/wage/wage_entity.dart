class WageEntity {
  final String id;
  final String name;
  final List<AdditionalIncomeEntityWageEntity> additionalIncomes;
  final StatusWageEntity status;
  final DateTime date;
  final List<DeductionEntityWageEntity> deductions;
  final ProviderWageEntity? provider;

  WageEntity({
    required this.id,
    required this.name,
    required this.additionalIncomes,
   required this.status,
    required this.date,
    required this.deductions,
    this.provider,
  });

  WageEntity copyWith({
    String? id,
    String? name,
    List<AdditionalIncomeEntityWageEntity>? additionalIncomes,
    StatusWageEntity? status,
    DateTime? date,
    List<DeductionEntityWageEntity>? deductions,
    ProviderWageEntity? provider,
  }) {
    return WageEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      additionalIncomes: additionalIncomes ?? this.additionalIncomes,
      status: status ?? this.status,
      date: date ?? this.date,
      deductions: deductions ?? this.deductions,
      provider: provider ?? this.provider,
    );
  }
}

class AdditionalIncomeWageEntity {
  final String description;
  final int amount;

  AdditionalIncomeWageEntity({
    required this.description,
    required this.amount,
  });

  AdditionalIncomeWageEntity copyWith({
    String? description,
    int? amount,
  }) {
    return AdditionalIncomeWageEntity(
      description: description ?? this.description,
      amount: amount ?? this.amount,
    );
  }
}

class DeductionWageEntity {
  final String description;
  final int amount;

  DeductionWageEntity({
    required this.description,
    required this.amount,
  });

  DeductionWageEntity copyWith({
    String? description,
    int? amount,
  }) {
    return DeductionWageEntity(
      description: description ?? this.description,
      amount: amount ?? this.amount,
    );
  }
}

class ProviderWageEntity {
  final String id;
  final String name;
  final String profileUrl;

  ProviderWageEntity({
    required this.id,
    required this.name,
    required this.profileUrl,
  });

  ProviderWageEntity copyWith({
    String? id,
    String? name,
    String? profileUrl,
  }) {
    return ProviderWageEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      profileUrl: profileUrl ?? this.profileUrl,
    );
  }
}

class StatusWageEntity {
  final String status;
  final String comment;
  final String userId;
  final DateTime date;

  StatusWageEntity({
    required this.status,
    required this.comment,
    required this.userId,
    required this.date,
  });

  StatusWageEntity copyWith({
    String? status,
    String? comment,
    String? userId,
    DateTime? date,
  }) {
    return StatusWageEntity(
      status: status ?? this.status,
      comment: comment ?? this.comment,
      userId: userId ?? this.userId,
      date: date ?? this.date,
    );
  }
}

class AdditionalIncomeEntityWageEntity {
  final String description;
  final int amount;

  AdditionalIncomeEntityWageEntity({
    required this.description,
    required this.amount,
  });

  AdditionalIncomeEntityWageEntity copyWith({
    String? description,
    int? amount,
  }) {
    return AdditionalIncomeEntityWageEntity(
      description: description ?? this.description,
      amount: amount ?? this.amount,
    );
  }
}

class DeductionEntityWageEntity {
  final String description;
  final int amount;

  DeductionEntityWageEntity({
    required this.description,
    required this.amount,
  });

  DeductionEntityWageEntity copyWith({
    String? description,
    int? amount,
  }) {
    return DeductionEntityWageEntity(
      description: description ?? this.description,
      amount: amount ?? this.amount,
    );
  }
}


