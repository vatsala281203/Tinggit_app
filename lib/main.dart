// main.dart
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:tinggit/utils/log_setup.dart';
import 'package:tinggit/screens/loginscreen.dart';
import 'log_setup.dart';

void main() {
  // Set up logging
  setupLogging();

  // Run the app
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: LoginScreen(),
    );
  }
}



