class NetworkFailure {
  final String message;
  final String error;

  NetworkFailure([this.message = "", this.error = ""]);
}

class InternetFailure extends NetworkFailure {
  InternetFailure([String? message])
      : super(message ?? "No Internet", "No Internet");
}

class RequestTimeoutFailure extends NetworkFailure {
  RequestTimeoutFailure([String? message])
      : super(message ?? "Request Timeout", "Request Time out");
}

class ServerFailure extends NetworkFailure {
  ServerFailure([String? message])
      : super(message ?? "Internal server", "Internal server error");
}

class InvalidUrlFailure extends NetworkFailure {
  InvalidUrlFailure([String? message])
      : super(message ?? "Invalid Url", "Invalid Url");
}

class BadRequestFailure extends NetworkFailure {
  BadRequestFailure([String? message])
      : super(message ?? "Bad request", "Bad request");
}

class FetchDataFailure extends NetworkFailure {
  FetchDataFailure([String? message])
      : super(message ?? "Fetch data", "Fetch data error");
}

class UnAuthorizedFailure extends NetworkFailure {
  UnAuthorizedFailure([String? message])
      : super(message ?? "Unauthorized", "Unauthorized");
}

class NotFoundFailure extends NetworkFailure {
  NotFoundFailure([String? message])
      : super(message ?? "Not found", "Not found");
}

class Forbidden extends NetworkFailure {
  Forbidden([String? message]) : super(message ?? "Forbidden", "Forbidden");
}

class MethodNotAllowed extends NetworkFailure {
  MethodNotAllowed([String? message])
      : super(message ?? "Method not", "Method not allowed");
}

class PayloadTooLarge extends NetworkFailure {
  PayloadTooLarge([String? message])
      : super(message ?? "Payload too large", "Payload too large");
}

class UnsupportedMediaType extends NetworkFailure {
  UnsupportedMediaType([String? message])
      : super(message ?? "Unsupported Media", "Unsupported Media Type");
}

class UnprocessableEntity extends NetworkFailure {
  UnprocessableEntity([String? message])
      : super(message ?? "Unprocessable Entity", "Unprocessable Entity");
}

class BadGateway extends NetworkFailure {
  BadGateway([String? message]) : super(message ?? "BadGateway", "Gateway");
}
