import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';
import 'add_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/add', // we can omit this (as it is by default anyway)
      routes: {
        '/': (context) => const HomeScreen(),
        '/add': (context) => const AddScreen(),
      },
    );
  }
}