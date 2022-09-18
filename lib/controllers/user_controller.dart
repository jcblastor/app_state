import 'package:get/get.dart';
import 'package:state_app/models/user.dart';

class UserController extends GetxController {
  RxBool existUser = false.obs;
  Rx<User> user = User().obs;

  void uploadUser(User user) {
    existUser.value = true;
    this.user.value = user;
  }

  void changeAge(int age) {
    user.update((val) {
      val!.age = age;
    });
  }

  void addProfession(String profession) {
    user.update((val) {
      val!.professions = [...?val.professions, profession];
    });
  }
}
