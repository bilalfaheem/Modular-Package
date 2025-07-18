class UserData {
  String aud;
  String iss;
  int exp;
  int nbf;
  String sub;
  String email;
  String jti;
  String uniqueName;

  String userType;
  String isActive;
  String refreshToken;
  String tenantId;
  String permissions;
  int iat;

  UserData({
    this.aud = "123",
    this.iss = '123',
    this.exp = 100,
    this.nbf = 123,
    this.sub = '123',
    this.email = 'abc',
    this.jti = '123',
    this.uniqueName = '123',
    this.userType = '123',
    this.isActive = '123',
    this.refreshToken = '123',
    this.tenantId = '123',
    this.permissions = '123',
    this.iat = 123,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        aud: json['aud'] as String,
        iss: json['iss'] as String,
        exp: json['exp'] as int,
        nbf: json['nbf'] as int,
        sub: json['sub'] as String,
        email: json['email'] as String,
        jti: json['jti'] as String,
        uniqueName: json['unique_name'] as String,
        permissions: json['Permissions'] as String,
        iat: json['iat'] as int,
      );

  Map<String, dynamic> toJson() => {
        'aud': aud,
        'iss': iss,
        'exp': exp,
        'nbf': nbf,
        'sub': sub,
        'email': email,
        'jti': jti,
        'unique_name': uniqueName,
        'UserType': userType,
        'IsActive': isActive,
        'RefreshToken': refreshToken,
        'TenantId': tenantId,
        'Permissions': permissions,
        'iat': iat,
      };
}
