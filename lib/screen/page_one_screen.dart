import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:state_app/block/user/user_cubit.dart';
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
            icon: const Icon(Icons.logout_outlined),
            onPressed: () {
              context.read<UserCubit>().logout();
            },
          )
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_circle_right_outlined),
        onPressed: () => Navigator.pushNamed(context, 'screenTwo'),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (_, state) {
      switch (state.runtimeType) {
        case InitUser:
          return const Center(child: Text('No hay información del usuario'));

        case ActiveUser:
          return _InfoUser((state as ActiveUser).user);

        default:
          return const Center(child: Text('No hay usuario y no hay estado'));
      }
      /*if (state is InitUser) {
        return const Center(child: Text('No hay información del usuario'));
      } else if (state is ActiveUser) {
        return _InfoUser(state.user);
      } else {
        return const Center(child: Text('No hay usuario y no hay estado'));
      }
      */
    });
  }
}

class _InfoUser extends StatelessWidget {
  final User user;

  const _InfoUser(this.user);
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
