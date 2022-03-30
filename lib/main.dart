import 'package:flutter/material.dart';
import 'package:todo_squirrel/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Squirrel ToDo List',
      home: OnboardingPage(),
    );
  }
}
