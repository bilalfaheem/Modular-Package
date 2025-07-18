class ChatEntity {
  final String token;
  final String sender, receiver, chatName, message;

  ChatEntity({
    required this.token,
    required this.sender,
    required this.receiver,
    this.chatName = '',
    this.message = '',
  });

  (String, Map<String, dynamic>) toJson() {
    return (
      token,
      {
        'name': chatName,
        'message': message,
        'participantIds': [sender, receiver],
      }
    );
  }
}
