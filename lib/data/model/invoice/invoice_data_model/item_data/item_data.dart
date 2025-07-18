import 'package:collection/collection.dart';
import 'package:service/domain/entities/invoice/invoice_entity.dart';

import 'time_sheet.dart';

class ItemData {
  List<TimeSheet>? timeSheet;

  ItemData({this.timeSheet});

  factory ItemData.fromJson(Map<String, dynamic> json) => ItemData(
        timeSheet: (json['TimeSheet'] as List<dynamic>?)
            ?.map((e) => TimeSheet.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'TimeSheet': timeSheet?.map((e) => e.toJson()).toList(),
      };

  ItemDataEntity toDomain() {
    return ItemDataEntity(
      timeSheet: timeSheet?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}
