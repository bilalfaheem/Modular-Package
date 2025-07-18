class RatingAndReviewEntity {
  final String token;
  final String id;

  RatingAndReviewEntity({
    required this.token,
    required this.id,
  });

  (String, String) toJson() {
    return (token, id);
  }

  const RatingAndReviewEntity.empty()
      : token = '123',
        id = '';
}
