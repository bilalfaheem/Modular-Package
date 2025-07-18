import 'package:service/domain/entities/review/rating_and_reviews_entity.dart';

class RatingAndReviewJson {
  num? rating;
  String? comment;
  String? userId;
  String? userName;
  String? profileUrl;
  DateTime? date;

  RatingAndReviewJson(
      {this.rating,
      this.comment,
      this.userId,
      this.userName,
      this.profileUrl,
      this.date});

  factory RatingAndReviewJson.fromJson(Map<String, dynamic> json) =>
      RatingAndReviewJson(
        rating: json["rating"],
        comment: json["comment"],
        userId: json["userId"],
        userName: json["userName"],
        profileUrl: json["profileUrl"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
      );

  RatingAndReviewsEntity toDomain() {
    return RatingAndReviewsEntity(
        rating: rating ?? 0,
        comment: comment ?? "N/A",
        userId: userId ?? "123",
        userName: userName ?? "John",
        profileUrl: profileUrl ?? '',
        date: date ?? DateTime.now());
  }
}
