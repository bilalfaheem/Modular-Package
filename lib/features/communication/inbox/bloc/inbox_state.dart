part of 'inbox_bloc.dart';

@immutable
class InboxState {
  final InboxInitialParams initialParams;
  final ApiResponse<BaseEntity<List<InboxEntity>>> inboxResponse;
  final ApiResponse<BaseEntity<List<InboxEntity>>> inboxPaginationResponse;

  const InboxState({
    required this.initialParams,
    this.inboxResponse = const ApiResponse.init(),
    this.inboxPaginationResponse = const ApiResponse.init(),
  });

  InboxState copyWith({
    InboxInitialParams? initialParams,
    ApiResponse<BaseEntity<List<InboxEntity>>>? inboxResponse,
    ApiResponse<BaseEntity<List<InboxEntity>>>? inboxPaginationResponse,
  }) {
    InboxState data = InboxState(
      initialParams: initialParams ?? this.initialParams,
      inboxResponse: inboxResponse ?? this.inboxResponse,
      inboxPaginationResponse:
          inboxPaginationResponse ?? this.inboxPaginationResponse,
    );
    Utils.logInfo(data.toString(), name: "Inbox");
    return data;
  }

  @override
  String toString() {
    return 'InboxState(initialParams: $initialParams, inboxResponse: ${inboxResponse.toString()})';
  }
}
