import 'socket_status.dart';

class SocketState<T> {
  SocketStatus? status;
  String? message;
  T? func;

  SocketState(this.status, this.message);

  SocketState.init() : status = SocketStatus.INIT;
  SocketState.connecting() : status = SocketStatus.CONNECTING;
  SocketState.connected() : status = SocketStatus.CONNECTED;
  SocketState.error(this.message) : status = SocketStatus.ERROR;

  @override
  String toString() {
    return " Status : $status \n Message :  $message";
  }
}
