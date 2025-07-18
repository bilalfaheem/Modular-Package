part of 'chat_bloc.dart';

@immutable
class ChatState {
  final ChatInitialParams initialParams;

  final ApiResponse<BaseEntity> chatResponse;
  final ApiResponse<BaseEntity<List<MessageEntity>>> getChatResponse;

  const ChatState({
    required this.initialParams,
    this.chatResponse = const ApiResponse.init(),
    this.getChatResponse = const ApiResponse.init(),
  });

  ChatState copyWith({
    ChatInitialParams? initialParams,
    ApiResponse<BaseEntity>? chatResponse,
    ApiResponse<BaseEntity<List<MessageEntity>>>? getChatResponse,
  }) {
    ChatState data = ChatState(
      initialParams: initialParams ?? this.initialParams,
      chatResponse: chatResponse ?? this.chatResponse,
      getChatResponse: getChatResponse ?? this.getChatResponse,
    );
    Utils.logInfo(data.toString(), name: "Chat");
    return data;
  }

  @override
  String toString() {
    return 'ChatState(initialParams: $initialParams, chatResponse: ${chatResponse.toString()},getChatResponse: ${getChatResponse.toString()})';
  }
}
