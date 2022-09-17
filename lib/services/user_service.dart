import 'package:flutter/material.dart';
import 'package:state_app/models/user.dart';

class UserService with ChangeNotifier {
  User? _user;

  bool get existUser => (_user != null) ? true : false;

  User? get user => _user;
  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  void changeAge(int age) {
    _user?.age = age;
    notifyListeners();
  }

  void removeUser() {
    _user = null;
    notifyListeners();
  }

  void adProf() {
    _user?.professions?.add('Profesión: ${_user!.professions!.length + 1}');
    notifyListeners();
  }
}
