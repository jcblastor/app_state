import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_app/block/user/user_cubit.dart';

import '../models/user.dart';

class PageTwoScreen extends StatelessWidget {
  const PageTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();

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
                final newUser = User(
                  name: 'Calos Guzmán',
                  age: 41,
                  professions: ['dev', 'back', 'front'],
                );
                userCubit.selectUser(newUser);
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
                userCubit.changeAge(30);
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
                userCubit.addProf();
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
