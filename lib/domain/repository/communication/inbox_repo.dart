import 'package:fpdart/fpdart.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/communication/inbox_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/communication/get_inbox_entity.dart';

abstract class InboxRepo {
  final Network network;
  final AppUrl appUrl;

  InboxRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity<List<InboxEntity>>>> inbox(GetInboxEntity data);
}
