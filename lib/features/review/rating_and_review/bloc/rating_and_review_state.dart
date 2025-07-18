part of 'rating_and_review_bloc.dart';

@immutable
class RatingAndReviewState {
  final RatingAndReviewInitialParams initialParams;
  final RatingAndReviewEntity ratingAndReviewEntity;
  final ApiResponse<BaseEntity<List<RatingAndReviewsEntity>>>
      ratingAndReviewResponse;
  final ApiResponse<BaseEntity<List<StaffEntity>>> staffResponse;

  const RatingAndReviewState({
    required this.initialParams,
    this.ratingAndReviewEntity = const RatingAndReviewEntity.empty(),
    this.ratingAndReviewResponse = const ApiResponse.init(),
    this.staffResponse = const ApiResponse.init(),
  });

  RatingAndReviewState copyWith({
    RatingAndReviewInitialParams? initialParams,
    ApiResponse<BaseEntity<List<RatingAndReviewsEntity>>>?
        ratingAndReviewResponse,
    ApiResponse<BaseEntity<List<StaffEntity>>>? staffResponse,
  }) {
    RatingAndReviewState data = RatingAndReviewState(
      initialParams: initialParams ?? this.initialParams,
      ratingAndReviewResponse:
          ratingAndReviewResponse ?? this.ratingAndReviewResponse,
      staffResponse: staffResponse ?? this.staffResponse,
    );
    Utils.logInfo(data.toString(), name: "RatingAndReview");
    return data;
  }

  @override
  String toString() {
    return 'RatingAndReviewState(initialParams: $initialParams, ratingAndReviewResponse: ${ratingAndReviewResponse.toString()})';
  }
}
