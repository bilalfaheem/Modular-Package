import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/communication/get_inbox_entity.dart';
import 'package:service/domain/entities/communication/inbox_entity.dart';
import 'package:service/domain/response/api_response.dart';
import 'package:service/domain/usecase/communication/inbox_use_case.dart';
import 'package:service/features/communication/inbox/inbox_initial_params.dart';
import 'package:service/utils/utils.dart';

part 'inbox_event.dart';
part 'inbox_state.dart';

class InboxBloc extends Bloc<InboxEvent, InboxState> {
  final InboxInitialParams _initialParams;
  final InboxUseCase _useCase;
  InboxBloc(this._initialParams, this._useCase)
      : super(InboxState(initialParams: _initialParams)) {
    on<FetchInboxEvent>(_fetchInbox);
    on<FetchMoreInboxEvent>(_fetchMoreInbox);
  }

  Future<void> _fetchInbox(
      FetchInboxEvent event, Emitter<InboxState> emit) async {
    emit(state.copyWith(inboxResponse: ApiResponse.loading()));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(inboxResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(inboxResponse: ApiResponse.completed(r)));
        }));
  }

  Future<void> _fetchMoreInbox(
      FetchMoreInboxEvent event, Emitter<InboxState> emit) async {
    emit(state.copyWith(inboxPaginationResponse: ApiResponse.loading()));
    await _useCase.execute(event.data).then((value) => value.fold((l) {
          emit(state.copyWith(
              inboxPaginationResponse: ApiResponse.error(l.error)));
        }, (r) {
          emit(state.copyWith(
              inboxPaginationResponse: ApiResponse.completed(r)));
        }));
  }
}
