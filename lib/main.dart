import 'package:flutter/material.dart';

import 'authorization/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeHealthy',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const LoginScreen(),
    );
  }
}
