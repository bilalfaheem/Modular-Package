import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:service/data/model/comment_json/comment_json.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/dispute/comment_entity.dart';
import 'package:service/domain/entities/dispute/new_comment_entity.dart';
import 'package:service/domain/response/api_response.dart';
import 'package:service/domain/usecase/dispute/comment_use_case.dart';
import 'package:service/features/dispute/comment/comment_initial_params.dart';
import 'package:service/utils/utils.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentInitialParams _initialParams;
  final CommentUseCase _useCase;
  CommentBloc(this._initialParams, this._useCase) : super(CommentState(initialParams: _initialParams)) {
    on<SubmitActionEvent>(_submitAction);
    on<StartConnectionEvent>(_starConnection);
    on<ReceiveCommentEvent>(_receiveComment);
    on<OnReceiveEvent>(_onReceiveComment);
    on<StopConnectionEvent>(_stopConnection);
  }

  Future<void> _submitAction(SubmitActionEvent event, Emitter<CommentState> emit) async {
    emit(state.copyWith(commentResponse: ApiResponse.loading()));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(commentResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(commentResponse: ApiResponse.completed(r)));
        }));
  }

  Future<void> _starConnection(StartConnectionEvent event, Emitter<CommentState> emit) async {
    emit(state.copyWith(startConnectionResponse: ApiResponse.loading()));
    await _useCase.executeStartConnection(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(startConnectionResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(startConnectionResponse: ApiResponse.completed(r)));
        }));
  }

  Future<void> _receiveComment(ReceiveCommentEvent event, Emitter<CommentState> emit) async {
    emit(state.copyWith(commentResponse: ApiResponse.loading()));
    await _useCase.executeReceiveComment((newComment) {
      Utils.logInfo(newComment.toString() + "--" + newComment.runtimeType.toString(), name: "NewComment");
      if (newComment is Map<String, dynamic>) {
        add(OnReceiveEvent(CommentJson.fromJson(newComment).toDomain()));
      }
      // if (newComment is Map) {
      //   emit(state.copyWith(onReceiveCommentResponse: ApiResponse.completed(CommentJson.fromJson(newComment).toDomain())));
      // }
    }).then((value) => value.fold((l) {
          emit(state.copyWith(commentResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(commentResponse: ApiResponse.completed(r)));
        }));
  }

  Future<void> _onReceiveComment(OnReceiveEvent event, Emitter<CommentState> emit) async {
    emit(state.copyWith(onReceiveCommentResponse: ApiResponse.completed(event.data)));
  }

  Future<void> _stopConnection(StopConnectionEvent event, Emitter<CommentState> emit) async {
    emit(state.copyWith(stopConnectionResponse: ApiResponse.loading()));
    await _useCase.executeStopConnection(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(stopConnectionResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(stopConnectionResponse: ApiResponse.completed(r)));
        }));
  }
}
