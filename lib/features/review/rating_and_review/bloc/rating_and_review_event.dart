part of 'rating_and_review_bloc.dart';

@immutable
sealed class RatingAndReviewEvent {}

class FetchReviews extends RatingAndReviewEvent {
  final RatingAndReviewEntity data;
  FetchReviews(this.data);
}

class FetchStaffsEvent extends RatingAndReviewEvent {
  final StaffsEntity data;
  FetchStaffsEvent(this.data);
}
