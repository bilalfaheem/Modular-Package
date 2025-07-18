import 'api_status.dart';

class ApiResponse<T> {
  final ApiStatus? status;
  final T? data;
  final String? message;

  const ApiResponse(this.status, this.data, this.message);

  const ApiResponse.init() : status = ApiStatus.init, data = null, message = null;
   ApiResponse.loading() : status = ApiStatus.loading, data = null, message = null;
   ApiResponse.completed(this.data) : status = ApiStatus.completed, message = null;
   ApiResponse.error(this.message) : status = ApiStatus.error, data = null;

  @override
  String toString() {
    return " Status : $status \n Message :  $message \n Data: $data";
  }
}
