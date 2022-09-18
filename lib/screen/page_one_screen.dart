import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_app/controllers/user_controller.dart';
import 'package:state_app/models/user.dart';

import 'package:state_app/screen/screen.dart';

class PageOneScreen extends StatelessWidget {
  const PageOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCtrl = Get.put(UserController());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Screen One'),
      ),
      body: Obx(
        () => userCtrl.existUser.value
            ? _InfoUser(
                user: userCtrl.user.value,
              )
            : _NoInfo(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_circle_right_outlined),
        // onPressed: () => Navigator.pushNamed(context, 'screenTwo'),
        onPressed: () => Get.to(
          () => const PageTwoScreen(),
          arguments: {'name': 'Carlos'},
        ),
      ),
    );
  }
}

class _NoInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No hay usuario seleccionado'));
  }
}

class _InfoUser extends StatelessWidget {
  final User user;

  const _InfoUser({
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListTile(title: Text('Nombre: ${user.name}')),
          ListTile(title: Text('Edad: ${user.age}')),
          const Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...user.professions!.map((prof) => ListTile(title: Text(prof)))
        ],
      ),
    );
  }
}
