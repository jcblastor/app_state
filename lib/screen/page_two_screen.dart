import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_app/services/user_service.dart';

import '../models/user.dart';

class PageTwoScreen extends StatelessWidget {
  const PageTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userServices = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: userServices.existUser ? Text(userServices.user!.name) : const Text('Screen two'),
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
                final newUser = User(
                  name: 'Carlos',
                  age: 41,
                  professions: ['dev', 'back', 'front'],
                );
                userServices.user = newUser;
                Navigator.pop(context, 'screenOne');
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
                userServices.changeAge(30);
                Navigator.pop(context, 'screenOne');
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
                userServices.adProf();
              },
            )
          ],
        ),
      ),
    );
  }
}
