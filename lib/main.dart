import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';
import 'add_screen.dart';
import 'transaction_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // we can omit this (as it is by default anyway)
      routes: {
        '/': (context) => HomeScreen(),
        '/add': (context) => const AddScreen(),
        '/list': (context) => const TransactionScreen(),
      },
    );
  }
}