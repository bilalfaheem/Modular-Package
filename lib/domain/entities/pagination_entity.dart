import 'package:collection/collection.dart';

class PaginationEntity {
  final int pageCount;
  final int totalItemCount;
  final int pageNumber;
  final int pageSize;
  final bool hasPreviousPage;
  final bool hasNextPage;
  final bool isFirstPage;
  final bool isLastPage;
  final int firstItemOnPage;
  final int lastItemOnPage;

  PaginationEntity({
    required this.pageCount,
    required this.totalItemCount,
    required this.pageNumber,
    required this.pageSize,
    required this.hasPreviousPage,
    required this.hasNextPage,
    required this.isFirstPage,
    required this.isLastPage,
    required this.firstItemOnPage,
    required this.lastItemOnPage,
  });

  const PaginationEntity.empty()
      : pageCount = 1,
        totalItemCount = 123,
        pageNumber = 1,
        pageSize = 20,
        hasPreviousPage = false,
        hasNextPage = false,
        isFirstPage = true,
        isLastPage = true,
        firstItemOnPage = 1,
        lastItemOnPage = 1;
}
