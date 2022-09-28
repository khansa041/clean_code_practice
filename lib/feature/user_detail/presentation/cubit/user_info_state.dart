import '../../domain/entities/user_entities.dart';

abstract class UserInfoState {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

class UserInfoInitialState extends UserInfoState {
  final String message;
  const UserInfoInitialState({required this.message});
}

class UserInfoLoadingState extends UserInfoState {}

class UserInfoLoadedState extends UserInfoState {
  final UserEntity userEntity;
  const UserInfoLoadedState({required this.userEntity});
}

class UserInfoErrorState extends UserInfoState {
  final String message;
  const UserInfoErrorState({required this.message});
}
