import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/repository/dispute/comment_repo.dart';
import 'package:service/domain/entities/dispute/comment_entity.dart';
import 'package:service/domain/failures/dispute/comment_failure.dart';
import 'package:service/domain/validator/dispute/comment_validator.dart';

class CommentUseCase {
  final CommentRepo _repo;
  final CommentValidator _validator;
  CommentUseCase(this._repo, this._validator);

  Future<Either<CommentFailure, BaseEntity>> execute(
          CommentEntity data) async =>
      _validator.validate(data).fold(
          (err) => left(CommentFailure(error: err.error)),
          (res) async => await _repo.addComment(res).then((value) => value.fold(
              (err) => left(CommentFailure(error: err.error)),
              (response) => right(response))));

  Future<Either<CommentFailure, BaseEntity>> executeStartConnection(
          CommentEntity data) async =>
      await _repo.startConnection(data).then((value) => value.fold(
          (err) => left(CommentFailure(error: err.error)),
          (response) => right(response)));

  Future<Either<CommentFailure, BaseEntity>> executeStopConnection(
          CommentEntity data) async =>
      await _repo.stopConnection(data).then((value) => value.fold(
          (err) => left(CommentFailure(error: err.error)),
          (response) => right(response)));

  Future<Either<CommentFailure, BaseEntity>> executeReceiveComment(
          void Function(Object?)? onReceive) async =>
      await _repo.receiveComment(onReceive).then((value) => value.fold(
          (err) => left(CommentFailure(error: err.error)),
          (response) => right(response)));
}
