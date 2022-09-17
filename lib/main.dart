import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:state_app/screen/screen.dart';
import 'package:state_app/services/user_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserService()),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: 'screenOne',
        routes: {
          'screenOne': (_) => const PageOneScreen(),
          'screenTwo': (_) => const PageTwoScreen(),
        },
      ),
    );
  }
}
