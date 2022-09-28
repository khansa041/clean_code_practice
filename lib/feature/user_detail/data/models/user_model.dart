import 'package:clean_code_practice/feature/user_detail/domain/entities/user_entities.dart';

class UserDetailModel extends UserEntity {
  const UserDetailModel(
      {required super.email,
      required super.id,
      required super.firstName,
      required super.lastName,
      required super.avatar});

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    return UserDetailModel(
      email: json['email'],
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }
}
