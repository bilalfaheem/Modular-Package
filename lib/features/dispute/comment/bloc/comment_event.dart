part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

class SubmitActionEvent extends CommentEvent {
  final CommentEntity data;
  SubmitActionEvent(this.data);
}

class StartConnectionEvent extends CommentEvent {
  final CommentEntity data;
  StartConnectionEvent(this.data);
}

class ReceiveCommentEvent extends CommentEvent {
  ReceiveCommentEvent();
}


class OnReceiveEvent extends CommentEvent {
  final NewCommentEntity data;
  OnReceiveEvent(this.data);
}

class StopConnectionEvent extends CommentEvent {
  final CommentEntity data;
  StopConnectionEvent(this.data);
}
