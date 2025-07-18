import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/communication/chat_entity.dart';
import 'package:service/domain/entities/communication/get_chat_entity.dart';
import 'package:service/domain/entities/communication/listen_chat_entity.dart';
import 'package:service/domain/entities/communication/message_entity.dart';
import 'package:service/domain/entities/communication/send_message_entity.dart';
import 'package:service/domain/response/api_response.dart';
import 'package:service/domain/usecase/communication/chat_use_case.dart';
import 'package:service/features/communication/chat/chat_initial_params.dart';
import 'package:service/utils/utils.dart';
import 'package:signalr_netcore/hub_connection.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatInitialParams _initialParams;
  final ChatUseCase _useCase;
  ChatBloc(this._initialParams, this._useCase)
      : super(ChatState(initialParams: _initialParams)) {
    on<CreateChatEvent>(_createChat);
    on<GetChatEvent>(_getChat);
    on<JoinChatEvent>(_joinChat);
  }

  Future<void> _createChat(
      CreateChatEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(chatResponse: ApiResponse.loading()));
    await _useCase
        .executeCreateChat(event.data)
        .then((value) => value.fold((l) {
              emit(state.copyWith(chatResponse: ApiResponse.error(l.error)));
            }, (r) {
              emit(state.copyWith(chatResponse: ApiResponse.completed(r)));
            }));
  }

  Future<void> _getChat(GetChatEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(getChatResponse: ApiResponse.loading()));
    await _useCase.executeGetChat(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(getChatResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(getChatResponse: ApiResponse.completed(r)));
        }));
  }

  Future<void> _joinChat(JoinChatEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(getChatResponse: ApiResponse.loading()));
    await _useCase.joinChat(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(getChatResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(
              initialParams: state.initialParams.copyWith(hubConnection: r)));
        }));
  }

  Future<void> _listenChat(
      ListenChatEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(getChatResponse: ApiResponse.loading()));
    await _useCase.listenChat(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(getChatResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(getChatResponse: ApiResponse.completed(r)));
        }));
  }

  Future<void> _sendMessage(
      SendMessageEvent event, Emitter<ChatState> emit) async {
    emit(state.copyWith(getChatResponse: ApiResponse.loading()));
    await _useCase.sendMessage(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(getChatResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(getChatResponse: ApiResponse.completed(r)));
        }));
  }
}
