class StaffEntity {
  final String id;
  final String email;
  final String name;
  final String role;
  final String phoneNo;
  final String userType;
  final String userName;
  final bool isActive;
  final String profileUrl;
  final String tenantId;
  final dynamic features;
  final dynamic data;

  StaffEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.phoneNo,
    required this.userType,
    required this.userName,
    required this.isActive,
    required this.profileUrl,
    required this.tenantId,
    required this.features,
    required this.data,
  });

  StaffEntity copyWith({
    String? id,
    String? email,
    String? name,
    String? role,
    String? phoneNo,
    String? userType,
    String? userName,
    bool? isActive,
    String? profileUrl,
    String? tenantId,
    dynamic features,
    dynamic data,
  }) {
    return StaffEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      role: role ?? this.role,
      phoneNo: phoneNo ?? this.phoneNo,
      userType: userType ?? this.userType,
      userName: userName ?? this.userName,
      isActive: isActive ?? this.isActive,
      profileUrl: profileUrl ?? this.profileUrl,
      tenantId: tenantId ?? this.tenantId,
      features: features ?? this.features,
      data: data ?? this.data,
    );
  }
}
