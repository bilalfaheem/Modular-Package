import 'package:service/domain/constant/user_type.dart';

class EditProfileEntity {
  final String email;
  final String name;
  final String phone;
  final UserType userType;

  EditProfileEntity({
    required this.email,
    required this.name,
    required this.phone,
    this.userType = UserType.Customer,
  });

  Map<String, dynamic> toJson() {
    return {
      "Name": name,
      "Email": email,
      'PhoneNumber': phone,
      'IsEmailConfirmed': "true",
      'UserType': userType.name,
      'IsActive': "true",
    };
  }
}
