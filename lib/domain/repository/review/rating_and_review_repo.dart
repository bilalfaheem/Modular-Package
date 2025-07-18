import 'package:fpdart/fpdart.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/review/rating_and_reviews_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/review/rating_and_review_entity.dart';

abstract class RatingAndReviewRepo {
  final Network network;
  final AppUrl appUrl;

  RatingAndReviewRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity<List<RatingAndReviewsEntity>>>>
      ratingAndReview(RatingAndReviewEntity data);
}
