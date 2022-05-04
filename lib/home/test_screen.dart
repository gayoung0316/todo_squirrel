import 'package:flutter/material.dart';
import 'package:todo_squirrel/home/character_goal_check.dart';
import 'package:todo_squirrel/home/home.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({Key? key}) : super(key: key);

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          MainScreens(),
          CharacterGoalCheck(),
        ],
      ),
    );
  }
}
