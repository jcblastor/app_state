import 'package:flutter/material.dart';
import 'package:state_app/services/user_service.dart';

import '../models/models.dart';

class PageTwoScreen extends StatelessWidget {
  const PageTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: StreamBuilder(
          stream: userService.userStream,
          builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData
                ? Text('Nombre ${snapshot.data!.name}')
                : const Text('Screen Two');
          },
        ),
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
                final newUser =
                    User(name: 'Carlos', age: 41, professions: ['dev', 'back', 'front']);
                userService.user = newUser;
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
                userService.changeAge(30);
              },
            ),
            const SizedBox(height: 10),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Añadir profesión',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
