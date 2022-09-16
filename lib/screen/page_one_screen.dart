import 'package:flutter/material.dart';
import 'package:state_app/models/models.dart';
import 'package:state_app/services/user_service.dart';

class PageOneScreen extends StatelessWidget {
  const PageOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Screen One'),
      ),
      body: StreamBuilder(
        stream: userService.userStream,
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          return snapshot.hasData
              ? _InfoUser(userService.user)
              : const Center(child: Text('No hay informacion del usuario'));
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
          const ListTile(title: Text('Profesión 1: ')),
          const ListTile(title: Text('Profesión 2: ')),
          const ListTile(title: Text('Profesión 3: ')),
        ],
      ),
    );
  }
}
