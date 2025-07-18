import 'package:collection/collection.dart';
import 'package:service/domain/entities/customer/customer_entity.dart';

class CustomerJson {
  String? id;
  String? email;
  String? name;
  String? role;
  String? phoneNo;
  String? userType;
  String? userName;
  bool? isActive;
  String? profileUrl;
  String? tenantId;
  dynamic features;
  dynamic data;

  CustomerJson({
    this.id,
    this.email,
    this.name,
    this.role,
    this.phoneNo,
    this.userType,
    this.userName,
    this.isActive,
    this.profileUrl,
    this.tenantId,
    this.features,
    this.data,
  });

  factory CustomerJson.fromJson(Map<String, dynamic> json) => CustomerJson(
        id: json['id'] as String?,
        email: json['email'] as String?,
        name: json['name'] as String?,
        role: json['role'] as String?,
        phoneNo: json['phoneNo'] as String?,
        userType: json['userType'] as String?,
        userName: json['userName'] as String?,
        isActive: json['isActive'] as bool?,
        profileUrl: json['profileUrl'] as String?,
        tenantId: json['tenantId'] as String?,
        features: json['features'] as dynamic,
        data: json['data'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'role': role,
        'phoneNo': phoneNo,
        'userType': userType,
        'userName': userName,
        'isActive': isActive,
        'profileUrl': profileUrl,
        'tenantId': tenantId,
        'features': features,
        'data': data,
      };

  CustomerEntity toDomain() {
    return CustomerEntity(
      id: id ?? '',
      email: email ?? '',
      name: name ?? '',
      role: role ?? '',
      phoneNo: phoneNo ?? '',
      userType: userType ?? '',
      userName: userName ?? '',
      isActive: isActive ?? false,
      profileUrl: profileUrl ?? '',
      tenantId: tenantId ?? '',
      features: features,
      data: data,
    );
  }
}
