import 'package:collection/collection.dart';
import 'package:service/domain/entities/pagination_entity.dart';

class PaginationJson {
  int? pageCount;
  int? totalItemCount;
  int? pageNumber;
  int? pageSize;
  bool? hasPreviousPage;
  bool? hasNextPage;
  bool? isFirstPage;
  bool? isLastPage;
  int? firstItemOnPage;
  int? lastItemOnPage;

  PaginationJson({
    this.pageCount,
    this.totalItemCount,
    this.pageNumber,
    this.pageSize,
    this.hasPreviousPage,
    this.hasNextPage,
    this.isFirstPage,
    this.isLastPage,
    this.firstItemOnPage,
    this.lastItemOnPage,
  });

  factory PaginationJson.fromJson(Map<String, dynamic> json) => PaginationJson(
        pageCount: json['pageCount'] as int?,
        totalItemCount: json['totalItemCount'] as int?,
        pageNumber: json['pageNumber'] as int?,
        pageSize: json['pageSize'] as int?,
        hasPreviousPage: json['hasPreviousPage'] as bool?,
        hasNextPage: json['hasNextPage'] as bool?,
        isFirstPage: json['isFirstPage'] as bool?,
        isLastPage: json['isLastPage'] as bool?,
        firstItemOnPage: json['firstItemOnPage'] as int?,
        lastItemOnPage: json['lastItemOnPage'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'pageCount': pageCount,
        'totalItemCount': totalItemCount,
        'pageNumber': pageNumber,
        'pageSize': pageSize,
        'hasPreviousPage': hasPreviousPage,
        'hasNextPage': hasNextPage,
        'isFirstPage': isFirstPage,
        'isLastPage': isLastPage,
        'firstItemOnPage': firstItemOnPage,
        'lastItemOnPage': lastItemOnPage,
      };

  PaginationEntity toDomain() {
    return PaginationEntity(
        pageCount: pageCount ?? 1,
        totalItemCount: totalItemCount ?? 123,
        pageNumber: pageNumber ?? 1,
        pageSize: pageSize ?? 20,
        hasPreviousPage: hasPreviousPage ?? false,
        hasNextPage: hasNextPage ?? false,
        isFirstPage: isFirstPage ?? true,
        isLastPage: isLastPage ?? true,
        firstItemOnPage: firstItemOnPage ?? 1,
        lastItemOnPage: lastItemOnPage ?? 1);
  }
}
