import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_app/block/user/user_cubit.dart';

import 'package:state_app/screen/screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
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
