part of 'comment_bloc.dart';

@immutable
class CommentState {
  final CommentInitialParams initialParams;
  final ApiResponse<BaseEntity> commentResponse;
  final ApiResponse<BaseEntity> startConnectionResponse;
  final ApiResponse<BaseEntity> stopConnectionResponse;
  final ApiResponse<NewCommentEntity> onReceiveCommentResponse;

  const CommentState({
    required this.initialParams,
    this.commentResponse = const ApiResponse.init(),
    this.startConnectionResponse = const ApiResponse.init(),
    this.stopConnectionResponse = const ApiResponse.init(),
    this.onReceiveCommentResponse = const ApiResponse.init(),
  });

  CommentState copyWith({
    CommentInitialParams? initialParams,
    ApiResponse<BaseEntity>? commentResponse,
    List<NewCommentEntity>? commentList,
    ApiResponse<BaseEntity>? startConnectionResponse,
    ApiResponse<BaseEntity>? stopConnectionResponse,
    ApiResponse<NewCommentEntity>? onReceiveCommentResponse,
  }) {
    CommentState data = CommentState(
      initialParams: initialParams ?? this.initialParams,
      commentResponse: commentResponse ?? this.commentResponse,
      startConnectionResponse: startConnectionResponse ?? this.startConnectionResponse,
      stopConnectionResponse: stopConnectionResponse ?? this.stopConnectionResponse,
      onReceiveCommentResponse: onReceiveCommentResponse ?? this.onReceiveCommentResponse,
    );
    Utils.logInfo(data.toString(), name: "Comment");
    return data;
  }

  @override
  String toString() {
    return 'CommentState(initialParams: $initialParams, commentResponse: ${commentResponse.toString()})';
  }
}
