part of 'wages_bloc.dart';

@immutable
class WagesState {
  final WagesInitialParams initialParams;
  final PaginationEntity paginationEntity;
  final WagesEntity wagesEntity;
  final ApiResponse<BaseEntity<List<WageEntity>>> wagesResponse;
  final ApiResponse<BaseEntity<List<WageEntity>>> wagesPaginationResponse;
  final ApiResponse<BaseEntity<List<StaffEntity>>> staffResponse;

  const WagesState({
    required this.initialParams,
    this.paginationEntity = const PaginationEntity.empty(),
    this.wagesEntity = const WagesEntity.empty(),
    this.wagesResponse = const ApiResponse.init(),
    this.wagesPaginationResponse = const ApiResponse.init(),
    this.staffResponse = const ApiResponse.init(),
  });

  WagesState copyWith({
    WagesInitialParams? initialParams,
    PaginationEntity? paginationEntity,
    WagesEntity? wagesEntity,
    ApiResponse<BaseEntity<List<WageEntity>>>? wagesResponse,
    ApiResponse<BaseEntity<List<WageEntity>>>? wagesPaginationResponse,
    ApiResponse<BaseEntity<List<StaffEntity>>>? staffResponse,
  }) {
    WagesState data = WagesState(
      initialParams: initialParams ?? this.initialParams,
      paginationEntity: paginationEntity ?? this.paginationEntity,
      wagesEntity: wagesEntity ?? this.wagesEntity,
      wagesResponse: wagesResponse ?? this.wagesResponse,
      wagesPaginationResponse: wagesPaginationResponse ?? this.wagesPaginationResponse,
      staffResponse: staffResponse ?? this.staffResponse,
    );
    Utils.logInfo(data.toString(), name: 'WagesState');
    return data;
  }

  @override
  String toString() {
    return 'WagesState(initialParams: $initialParams, paginationEntity: $paginationEntity, wagesEntity: ${wagesEntity.toJson()}, wagesResponse: ${wagesResponse.toString()}, wagesPaginationResponse: ${wagesPaginationResponse.toString()}, staffResponse: ${staffResponse.toString()})';
  }
}
