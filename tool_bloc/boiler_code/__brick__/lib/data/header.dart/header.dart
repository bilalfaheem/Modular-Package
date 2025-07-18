import 'package:service/domain/constant/app_constant.dart';

class Header {
  static String tenantId = AppConstant.tenantId;

  static Map<String, String> _baseHeaders(String acceptType) {
    return {
      'BD-Tenant-Id': tenantId,
      'Accept': acceptType,
    };
  }

  static Map<String, String> contentTypeText() {
    return {
      ..._baseHeaders('text/plain'),
      'Content-Type': 'application/json',
    };
  }

  static Map<String, String> contentTypeMultipart() {
    return {
      ..._baseHeaders('text/plain'),
      'Content-Type': 'multipart/form-data',
    };
  }

  static Map<String, String> bearerHeaderOnly(String token, [String acceptType = 'application/json']) {
    return {
      ..._baseHeaders(acceptType),
      'Authorization': "Bearer $token",
    };
  }

  static Map<String, String> bearerHeaderWithMultipart(String token) {
    return {
      ...bearerHeaderOnly(token),
      'Content-Type': 'multipart/form-data',
    };
  }

  static Map<String, String> bearerHeaderWithApplicationJson(String token) {
    return {
      ...bearerHeaderOnly(token),
      'Content-Type': 'application/json',
    };
  }

  static Map<String, String> bearerHeaderWithUrlEncoded(String token) {
    return {
      ...bearerHeaderOnly(token),
      'Content-Type': 'application/x-www-form-urlencoded',
    };
  }
}
