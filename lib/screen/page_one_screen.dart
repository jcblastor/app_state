import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_app/bloc/user/user_bloc.dart';
import 'package:state_app/models/user.dart';

class PageOneScreen extends StatelessWidget {
  const PageOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Screen One'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline_rounded),
            onPressed: () {
              BlocProvider.of<UserBloc>(context, listen: false).add(DeleteUser());
            },
          )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (_, state) {
          return state.existUser
              ? _InfoUser(user: state.user!)
              : const Center(child: Text('No hay usuario seleccionado'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_circle_right_outlined),
        onPressed: () => Navigator.pushNamed(context, 'screenTwo'),
      ),
    );
  }
}

class _InfoUser extends StatelessWidget {
  final User user;

  const _InfoUser({
    Key? key,
    required this.user,
  }) : super(key: key);

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
          ...user.professions.map((prof) => ListTile(title: Text(prof)))
        ],
      ),
    );
  }
}
