import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_app/controllers/user_controller.dart';
import 'package:state_app/models/user.dart';

class PageTwoScreen extends StatelessWidget {
  const PageTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.find<UserController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Screen Two'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userCtrl.uploadUser(
                  User(name: 'Carlos', age: 41, professions: ['dev', 'back', 'front']),
                );
                Get.snackbar('Usuario establecido', 'Carlos es el nombre del usuario');
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userCtrl.changeAge(30);
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 10),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Añadir profesión',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                userCtrl.addProfession(
                    'Flutter developer #${userCtrl.user.value.professions!.length + 1}');
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
