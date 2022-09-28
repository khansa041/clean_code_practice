import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const UserEntity({
    required this.email,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  @override
  List<Object> get props => [email, id, firstName, lastName, avatar];
}
