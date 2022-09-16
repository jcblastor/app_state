import 'dart:async';

import 'package:state_app/models/models.dart';

class _UserService {
  User? _user;
  final StreamController<User> _userStreamController = StreamController<User>.broadcast();

  bool get existUser => _user != null ? true : false;

  Stream<User> get userStream => _userStreamController.stream;

  User get user => _user!;
  set user(User user) {
    _user = user;
    _userStreamController.add(user);
  }

  void changeAge(int value) {
    _user!.age = value;
    _userStreamController.add(user);
  }

  dispose() {
    _userStreamController.close();
  }
}

final userService = _UserService();
