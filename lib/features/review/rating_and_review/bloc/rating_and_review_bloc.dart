import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/review/rating_and_review_entity.dart';
import 'package:service/domain/entities/review/rating_and_reviews_entity.dart';
import 'package:service/domain/entities/staff/staff_entity.dart';
import 'package:service/domain/entities/staff/staffs_entity.dart';
import 'package:service/domain/response/api_response.dart';
import 'package:service/domain/usecase/review/rating_and_review_use_case.dart';
import 'package:service/features/review/rating_and_review/rating_and_review_initial_params.dart';
import 'package:service/utils/utils.dart';

part 'rating_and_review_event.dart';
part 'rating_and_review_state.dart';

class RatingAndReviewBloc
    extends Bloc<RatingAndReviewEvent, RatingAndReviewState> {
  final RatingAndReviewInitialParams _initialParams;
  final RatingAndReviewUseCase _useCase;
  RatingAndReviewBloc(this._initialParams, this._useCase)
      : super(RatingAndReviewState(initialParams: _initialParams)) {
    on<FetchReviews>(_fetchReviews);
    on<FetchStaffsEvent>(_fetchStaffs);
  }

  Future<void> _fetchReviews(
      FetchReviews event, Emitter<RatingAndReviewState> emit) async {
    emit(state.copyWith(ratingAndReviewResponse: ApiResponse.loading()));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(
              ratingAndReviewResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(
              ratingAndReviewResponse: ApiResponse.completed(r)));
        }));
  }

  Future<void> _fetchStaffs(
      FetchStaffsEvent event, Emitter<RatingAndReviewState> emit) async {
    emit(state.copyWith(staffResponse: ApiResponse.loading()));
    await _useCase.executeStaffs(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(staffResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(staffResponse: ApiResponse.completed(r)));
        }));
  }
}
