import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static logSuccess(String msg, {String? name}) {
    // if
    log('\x1B[32m$msg\x1B[0m', name: name != null ? '\x1B[32m$name\x1B[0m' : "");
  }

  static logError(String msg, {String? name}) {
    log('\x1B[31m$msg\x1B[0m', name: name != null ? '\x1B[31m$name\x1B[0m' : "");
  }

  static logInfo(String msg, {String? name}) {
    log('\x1B[37m$msg\x1B[0m', name: name != null ? '\x1B[37m$name\x1B[0m' : "");
  }

  static toastMessage(String message, BuildContext? context) {
    if (context != null) {
      FToast toast = FToast();
      toast.init(context);
      toast.removeCustomToast();
      toast.showToast(
        gravity: ToastGravity.TOP,
        child: Container(
          // constraints: BoxConstraints(maxWidth: 1.sh * 0.8),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(24)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image.asset(
              //   AppAsset.logoPng,
              //   height: 25.h,
              // ),
              // 10.horizontalSpace,
              Flexible(
                child: Text(
                  message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  static toastErrMessage(String message, BuildContext? context) {
    if (message == "Unauthorized") {
      // logout(getIt());
    }
    if (context != null) {
      FToast toast = FToast();
      toast.init(context);
      toast.removeCustomToast();
      toast.showToast(
        gravity: ToastGravity.TOP,
        child: Container(
          // constraints: BoxConstraints(maxWidth: 1 * 0.8),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(24)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Image.asset(
              //   AppAsset.logoPng,
              //   height: 25.h,
              // ),
              // 10.horizontalSpace,
              Flexible(
                child: Text(
                  message,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
