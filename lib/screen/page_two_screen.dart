import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_app/bloc/user/user_bloc.dart';
import 'package:state_app/models/user.dart';

class PageTwoScreen extends StatelessWidget {
  const PageTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Screen One'),
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
                userBloc.add(ActivateUser(newUser));
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
                userBloc.add(ChangeUserAge(30));
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
                userBloc.add(AddProfession('Flutter dev'));
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
