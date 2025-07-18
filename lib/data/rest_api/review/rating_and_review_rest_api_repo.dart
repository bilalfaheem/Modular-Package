import 'package:fpdart/fpdart.dart';
import 'package:service/data/header.dart/header.dart';
import 'package:service/data/model/review/rating_and_review_json/rating_and_review_json.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/review/rating_and_reviews_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/repository/review/rating_and_review_repo.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/data/model/base_json.dart';
import 'package:service/domain/entities/review/rating_and_review_entity.dart';

class RatingAndReviewRestApiRepo implements RatingAndReviewRepo {
  final Network network;
  final AppUrl appUrl;
  RatingAndReviewRestApiRepo(this.network, this.appUrl);
  @override
  Future<Either<RepoFailure, BaseEntity<List<RatingAndReviewsEntity>>>>
      ratingAndReview(RatingAndReviewEntity data) => network
          .get(
            appUrl.ratingAndReviewUrl,
            pathVariable: "${data.toJson().$2}/Reviews",
            Header.bearerHeaderWithApplicationJson(data.toJson().$1),
          )
          .then((value) =>
              value.fold((l) => left(RepoFailure(error: l.error)), (response) {
                try {
                  return right(BaseJson<List<RatingAndReviewJson>>.fromJson(
                          response,
                          (response['data'] as List<dynamic>)
                              .map((e) => RatingAndReviewJson.fromJson(
                                  e as Map<String, dynamic>))
                              .toList())
                      .toDomain((data) =>
                          data?.map((e) => e.toDomain()).toList() ?? []));
                } catch (e) {
                  return left(RepoFailure(error: e.toString()));
                }
              }));
}
