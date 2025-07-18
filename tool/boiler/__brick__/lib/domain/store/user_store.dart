import 'dart:convert';
import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserStore extends GetxController {
  static late SharedPreferences prefs;
  static UserData? userLocally;

  setUserData({required UserData value}) {
    userLocally = value;
    Utils.logInfo(value.user.token.toString(), name: "SaveLOcally");

    update();
  }

  setCurrentUserType({required bool isWaiter}) {
    userLocally!.user.currentUserType = isWaiter ? 'waiter' : 'client';
    saveUserLocally(value: userLocally!);
  }

  setWalletConnectivity({required bool connected}) async {
    var temporaryUserData = userLocally;
    temporaryUserData!.waiter.isWalletCreated = connected;
    await saveUserLocally(value: temporaryUserData);
    log(userLocally!.waiter.isWalletCreated.toString(),
        name: "isWalletCreated setWalletConnectivity");
  }

  enableNotification({required bool enabled}) async {
    var temp = userLocally;
    temp!.user.notificationOn = enabled;
    await saveUserLocally(value: temp);
    log(userLocally!.user.notificationOn.toString(),
        name: "Notification Enable Status");
  }

  removeUserData() {
    userLocally = null;
    update();
  }

  Future<void> saveUserLocally({required UserData value}) async {
    String jsonString = jsonEncode(value.toJson());
    await prefs.remove(UserStoreKey.userData);
    await prefs
        .setString(UserStoreKey.userData, jsonString)
        .then((onValue) => userLocally = value);
  }

  Either<ValidationFailure, UserData> readUserLocally() {
    String? jsonString = prefs.getString(UserStoreKey.userData);
    if (jsonString != null) {
      userLocally = UserData.fromJson(jsonDecode(jsonString));
      return right(userLocally!);
    } else {
      return left(ValidationFailure(error: "No Local Data"));
    }
  }

  Future<void> deleteUserLocally() async {
    await prefs.remove(UserStoreKey.userData);
    userLocally = null;
  }

  Future<void> deleteRememberMe() async {
    await prefs.remove(UserStoreKey.rememberMe);
  }
  // static Future<void> saveStringLocally(
  //     {required String key, required String value}) async {
  //   await prefs.setString(key, value);
  // }

  Future<void> saveRemeberMe({required Login value}) async {
    String jsonString = jsonEncode(value.toJson());
    await prefs.setString(UserStoreKey.rememberMe, jsonString);
    // .then((onValue) => userLocally = value);
  }

  Either<ValidationFailure, Login> readRemeberMe() {
    String? jsonString = prefs.getString(UserStoreKey.rememberMe);
    if (jsonString != null) {
      Login credLocally = Login.fromJson(jsonDecode(jsonString));
      if (credLocally.email != "") {
        return right(credLocally);
      } else {
        return left(ValidationFailure(error: "No Local Data"));
      }
    } else {
      return left(ValidationFailure(error: "No Local Data"));
    }
  }
}

// class SharedPreferencesServices {
//   static late SharedPreferences prefs;
//   static FakeModel? userLocally;
//   // Future<void> init() async {
//   //   // Initialization is not needed for SharedPreferences as it initializes automatically when used.
//   // }

//   static Future<void> saveLocally(
//       {required String key, required UserJsonModel value}) async {
//     String jsonString = jsonEncode(value);
//     await prefs
//         .setString(key, jsonString)
//         .then((onValue) => userLocally = value);
//   }

//   static UserJsonModel? readLocally({required String key}) {
//     String? jsonString = prefs.getString(key);
//     if (jsonString != null) {
//       userLocally = UserJsonModel.fromJson(jsonDecode(jsonString));
//       return userLocally;
//     } else {
//       return null;
//     }
//   }

//   static Future<void> deleteLocally({required String key}) async {
//     await prefs.remove(key);
//     userLocally = null;
//   }

//   static Future<void> saveStringLocally(
//       {required String key, required String value}) async {
//     await prefs.setString(key, value);
//   }

//   static String? readStringLocally({required String key}) {
//     return prefs.getString(key);
//   }
// }
