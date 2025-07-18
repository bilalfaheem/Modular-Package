import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/dispute/comment_entity.dart';
import 'package:service/domain/failures/validation_failure.dart';
import 'package:service/domain/validator/validator.dart';

class CommentValidator {
  Either<ValidationFailure, CommentEntity> validate(CommentEntity data) {
    if (Validator.validate(data.comment, "Comment") != null) {
      return left(ValidationFailure(error: Validator.validate(data.comment, "Comment")!));
    } else {
      return right(data);
    }
  }
}
