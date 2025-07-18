class RatingAndReviewsEntity {
  final num rating;
  final String comment;
  final String userId;
  final String userName;
  final String profileUrl;
  final DateTime date;
  RatingAndReviewsEntity({
    required this.rating,
    required this.comment,
    required this.userId,
    required this.userName,
    required this.profileUrl,
    required this.date,
  });

  RatingAndReviewsEntity copyWith({
    num? rating,
    String? comment,
    String? userId,
    String? userName,
    String? profileUrl,
    DateTime? date,
  }) {
    return RatingAndReviewsEntity(
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      profileUrl: profileUrl ?? this.profileUrl,
      date: date ?? this.date,
    );
  }
}
