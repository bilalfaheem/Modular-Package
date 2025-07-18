

class InboxEntity {
  final String id;
  final String name;
  final DateTime date;
  final List<InboxParticipantEntity> participants;

  InboxEntity({
    required this.id,
    required this.name,
    required this.date,
    required this.participants,
  });

  InboxEntity copyWith({
    String? id,
    String? name,
    DateTime? date,
    List<InboxParticipantEntity>? participants,
  }) {
    return InboxEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      date: date ?? this.date,
      participants: participants ?? this.participants,
    );
  }
}

class InboxParticipantEntity {
  final String id;
  final String name;
  final String profileUrl;

  InboxParticipantEntity({
    required this.id,
    required this.name,
    required this.profileUrl,
  });

  InboxParticipantEntity copyWith({
    String? id,
    String? name,
    String? profileUrl,
  }) {
    return InboxParticipantEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      profileUrl: profileUrl ?? this.profileUrl,
    );
  }
}
