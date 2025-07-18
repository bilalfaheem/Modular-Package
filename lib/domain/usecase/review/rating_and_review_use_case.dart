import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/review/rating_and_reviews_entity.dart';
import 'package:service/domain/entities/staff/staff_entity.dart';
import 'package:service/domain/entities/staff/staffs_entity.dart';
import 'package:service/domain/failures/staff/staffs_failure.dart';
import 'package:service/domain/repository/review/rating_and_review_repo.dart';
import 'package:service/domain/entities/review/rating_and_review_entity.dart';
import 'package:service/domain/failures/review/rating_and_review_failure.dart';
import 'package:service/domain/repository/staff/staffs_repo.dart';

class RatingAndReviewUseCase {
  final RatingAndReviewRepo _repo;
  final StaffsRepo _staffsRepo;

  RatingAndReviewUseCase(this._repo, this._staffsRepo);

  Future<
          Either<RatingAndReviewFailure,
              BaseEntity<List<RatingAndReviewsEntity>>>>
      execute(RatingAndReviewEntity data) async =>
          await _repo.ratingAndReview(data).then((value) => value.fold(
              (err) => left(RatingAndReviewFailure(error: err.error)),
              (response) => right(response)));

  Future<Either<StaffsFailure, BaseEntity<List<StaffEntity>>>> executeStaffs(
          StaffsEntity data) async =>
      await _staffsRepo.staffs(data).then((value) => value.fold(
          (err) => left(StaffsFailure(error: err.error)),
          (response) => right(response)));
}
