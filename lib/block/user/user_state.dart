part of 'user_cubit.dart';

// @immutable
abstract class UserState {}

class InitUser extends UserState {
  final existUser = false;
}

class ActiveUser extends UserState {
  final existUser = true;
  final User user;

  ActiveUser(this.user);
}
