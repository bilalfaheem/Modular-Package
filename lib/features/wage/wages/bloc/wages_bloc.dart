import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/pagination_entity.dart';
import 'package:service/domain/entities/staff/staff_entity.dart';
import 'package:service/domain/entities/staff/staffs_entity.dart';
import 'package:service/domain/entities/wage/wage_entity.dart';
import 'package:service/domain/entities/wage/wages_entity.dart';
import 'package:service/domain/response/api_response.dart';
import 'package:service/domain/usecase/wage/wages_use_case.dart';
import 'package:service/features/wage/wages/wages_initial_params.dart';
import 'package:service/utils/utils.dart';

part 'wages_event.dart';
part 'wages_state.dart';

class WagesBloc extends Bloc<WagesEvent, WagesState> {
  final WagesInitialParams _initialParams;
  final WagesUseCase _useCase;
  WagesBloc(this._initialParams, this._useCase) : super(WagesState(initialParams: _initialParams, wagesEntity: WagesEntity.empty())) {
    on<FetchWagesEvent>(_fetchWages);
    on<FetchMoreWagesEvent>(_fetchMoreWages);
    on<FetchStaffsEvent>(_fetchStaffs);
  }

  Future<void> _fetchWages(FetchWagesEvent event, Emitter<WagesState> emit) async {
    emit(state.copyWith(wagesResponse: ApiResponse.loading(), wagesEntity: event.data));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(wagesResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(paginationEntity: r.pagination, wagesResponse: ApiResponse.completed(r)));
        }));
  }

  Future<void> _fetchMoreWages(FetchMoreWagesEvent event, Emitter<WagesState> emit) async {
    emit(state.copyWith(wagesPaginationResponse: ApiResponse.loading(), wagesEntity: event.data));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(wagesPaginationResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(paginationEntity: r.pagination, wagesPaginationResponse: ApiResponse.completed(r)));
        }));
  }

  Future<void> _fetchStaffs(FetchStaffsEvent event, Emitter<WagesState> emit) async {
    emit(state.copyWith(staffResponse: ApiResponse.loading()));
    await _useCase.executeStaffs(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(staffResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(staffResponse: ApiResponse.completed(r)));
        }));
  }
}
