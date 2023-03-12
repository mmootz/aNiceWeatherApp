import 'package:flutter/material.dart';
import 'screens/MainMenu.dart';

void main() {
  runApp(const weatherApp());
}

class weatherApp extends StatelessWidget {
  const weatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A nice weather app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainMenu(title: 'A nice weather app'),
    );
  }
}
