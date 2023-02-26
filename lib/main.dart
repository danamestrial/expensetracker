import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'add_screen.dart';
import 'transaction_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/', // we can omit this (as it is by default anyway)
      routes: {
        '/': (context) => const HomeScreen(),
        '/add': (context) => const AddScreen(),
        '/list': (context) => const TransactionScreen(),
      },
    );
  }
}