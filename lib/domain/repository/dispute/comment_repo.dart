import 'package:fpdart/fpdart.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/dispute/comment_entity.dart';

abstract class CommentRepo {
  final Network network;
  final AppUrl appUrl;

  CommentRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity>> addComment(CommentEntity data);
  Future<Either<RepoFailure, BaseEntity>> startConnection(CommentEntity data);
  Future<Either<RepoFailure, BaseEntity>> stopConnection(CommentEntity data);
  Future<Either<RepoFailure, BaseEntity>> receiveComment(void Function(Object?)? onReceive);
}
