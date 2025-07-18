import 'package:service/domain/constant/user_type.dart';

class SignupEntity {
  final String name, email, phoneNo, password;
  final UserType userType;
  final bool isEmailConfirmed;

  SignupEntity({
    required this.email,
    required this.name,
    required this.phoneNo,
    required this.password,
    this.userType = UserType.Customer,
    this.isEmailConfirmed = true,
  });

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Email': email,
      'UserName': name,
      'PhoneNumber': phoneNo,
      'UserType': userType.name,
      'Password': password,
      'IsEmailConfirmed': isEmailConfirmed.toString()
    };
  }
}
