import 'package:fpdart/fpdart.dart';
import 'package:service/data/network/network.dart';
import 'package:service/data/url/app_url.dart';
import 'package:service/domain/entities/base_entity.dart';
import 'package:service/domain/entities/customer/customer_entity.dart';
import 'package:service/domain/entities/customer/customers_entity.dart';
import 'package:service/domain/failures/repo_failure.dart';

abstract class CustomersRepo {
  final Network network;
  final AppUrl appUrl;

  CustomersRepo(this.network, this.appUrl);
  Future<Either<RepoFailure, BaseEntity<List<CustomerEntity>>>> customers(
      CustomersEntity data);
}
