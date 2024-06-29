import 'package:flutter/material.dart';
import 'package:second/project/first_page.dart';
import 'package:second/project/login_page.dart';
import 'package:second/project/calculator.dart';
import 'package:second/project/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: FirstPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/welcome': (context) => FirstPage(),
        '/calculator': (context) => CalculatorPage(),
      },
    );
  }
}
