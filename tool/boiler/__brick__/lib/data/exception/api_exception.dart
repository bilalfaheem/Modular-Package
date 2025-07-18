// ignore_for_file: prefer_typing_uninitialized_variables

class ApiException implements Exception {
  final _message;
  final _prefix;

  ApiException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class InternetException extends ApiException {
  InternetException([String? message]) : super(message, "No internet");
}

class RequestTimeOut extends ApiException {
  RequestTimeOut([String? message]) : super(message, 'Request Time out');
}

class ServerException extends ApiException {
  ServerException([String? message]) : super(message, 'Internal server error');
}

class InvalidUrlException extends ApiException {
  InvalidUrlException([String? message]) : super(message, 'Invalid Url');
}

class BadRequestException extends ApiException {
  BadRequestException([String? message]) : super(message, '');
}

class FetchDataException extends ApiException {
  FetchDataException([String? message]) : super(message, '');
}

class UnauthorisedException extends ApiException {
  UnauthorisedException([String? message]) : super(message, "");
}

class NotFoundException extends ApiException {
  NotFoundException([String? message]) : super(message, "");
}
