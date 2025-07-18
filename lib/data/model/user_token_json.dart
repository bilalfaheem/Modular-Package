import 'package:service/domain/entities/user_token_entity.dart';

class UserTokenJson {
  String? accessToken;
  String? refreshToken;
  int? expiresIn;

  UserTokenJson({this.accessToken, this.refreshToken, this.expiresIn});

  factory UserTokenJson.fromJson(Map<String, dynamic> json) => UserTokenJson(
        accessToken: json['accessToken'] as String?,
        refreshToken: json['refreshToken'] as String?,
        expiresIn: json['expiresIn'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'expiresIn': expiresIn,
      };

  UserTokenEntity toDomain() {
    return UserTokenEntity(
      accessToken: accessToken ?? '',
      refreshToken: refreshToken ?? '',
      expiresIn: expiresIn ?? 0,
    );
  }
}
