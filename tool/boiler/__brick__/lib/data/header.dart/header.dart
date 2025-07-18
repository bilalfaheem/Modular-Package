class Header {
  static Map<String, String> contentTypeOnly() {
    return {
      'Content-Type': 'application/json',
    };
  }

  static Map<String, String> bearerHeaderOnly(String token) {
    return {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
    };
  }

  static Map<String, String> bearerHeaderWithMultipart(String token) {
    return {
      'Authorization': "Bearer $token",
      // 'Content-Type': 'multipart/form-data',
    };
  }

  static Map<String, String> bearerHeaderWithApplicationJson(String token) {
    return {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json',
    };
  }
}
