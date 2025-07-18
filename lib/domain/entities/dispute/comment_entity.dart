import 'package:logging/logging.dart';
class CommentEntity {
  final String token;
  final String ticketId;
  final String comment;
  final Logger? logger;

  CommentEntity({
    required this.token,
    required this.ticketId,
    required this.comment,
    this.logger
  });

  (String, Map<String, dynamic>) toJson() {
    return (token, {'Comment': comment});
  }
}
