import 'package:fpdart/fpdart.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/communication/inbox_entity.dart';
import 'package:service/domain/repository/communication/inbox_repo.dart';
import 'package:service/domain/entities/communication/get_inbox_entity.dart';
import 'package:service/domain/failures/communication/inbox_failure.dart';

class InboxUseCase {
  final InboxRepo _repo;
  InboxUseCase(this._repo);

  Future<Either<InboxFailure, BaseEntity<List<InboxEntity>>>> execute(
          GetInboxEntity data) async =>
      await _repo.inbox(data).then((value) => value.fold(
          (err) => left(InboxFailure(error: err.error)),
          (response) => right(response)));
}
