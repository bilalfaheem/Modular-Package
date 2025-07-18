import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:service/domain/entities/business_unit_entity.dart';
import 'package:service/domain/entities/user_entity.dart';
import 'package:service/domain/failures/user_store_failure.dart';
import 'package:service/domain/failures/validation_failure.dart';
import 'package:service/domain/store/user_store_key.dart';
import 'package:service/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStore extends GetxController {
  static late SharedPreferences prefs;
  static UserData? userLocally;
  static String? JWT;
  static BusinessUnit? businessUnit;

  setUserData({required UserData value}) {
    userLocally = value;
    Utils.logInfo(value.email.toString(), name: "SaveLOcally");

    update();
  }

  saveBusinessUnit({required BusinessUnit value}) async {
    try {
      businessUnit = value;
      prefs.remove(UserStoreKey.businessUnit);
      prefs.setString(UserStoreKey.businessUnit, value.toJson().toString());
      update();
      return right(value);
    } catch (e) {
      return left(UserStoreFailure(error: e.toString()));
    }
  }

  readBusinessUnit() {
    var bu = prefs.getString(UserStoreKey.businessUnit);
    if (bu != null) {
      businessUnit = BusinessUnit.fromJson(jsonDecode(bu));
    }
  }

  removeUserData() {
    userLocally = null;
    update();
  }

  Future<Either<UserStoreFailure, String>> saveUserLocally({required String token}) async {
    try {
      JWT = token;
      Map<String, dynamic> decoded = JwtDecoder.decode(token);
      userLocally = UserData.fromJson(decoded);
      Utils.logInfo(token, name: "token");
      Utils.logInfo(decoded.toString(), name: "decoded");
      Utils.logInfo(userLocally.toString(), name: "userLocally");

      await prefs.remove(UserStoreKey.userJWT);
      await prefs.setString(UserStoreKey.userJWT, token);
      return right(token);
    } catch (e) {
      return left(UserStoreFailure(error: e.toString()));
    }
  }

  Either<ValidationFailure, UserData> readUserLocallyd() {
    JWT = prefs.getString(UserStoreKey.userJWT);

    if (JWT != null) {
      Map<String, dynamic> decoded = JwtDecoder.decode(JWT!);

      userLocally = UserData.fromJson(decoded);
      return right(userLocally!);
    } else {
      return left(ValidationFailure(error: "No Local Data"));
    }
  }

  Future<void> deleteUserLocally() async {
    await prefs.remove(UserStoreKey.userJWT);
    await prefs.remove(UserStoreKey.businessUnit);
    businessUnit = null;
    userLocally = null;
    JWT = null;
  }
}
