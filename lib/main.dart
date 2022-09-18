import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:state_app/screen/screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'screenOne',
      // para trabajar con rutas en getx
      getPages: [
        GetPage(name: '/screenOne', page: () => const PageOneScreen()),
        GetPage(name: '/screenTwo', page: () => const PageTwoScreen()),
      ],
      /*
      routes: {
        'screenOne': (_) => const PageOneScreen(),
        'screenTwo': (_) => const PageTwoScreen(),
      },
      */
    );
  }
}
