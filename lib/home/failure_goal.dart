import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';

class FailureGoalPage extends StatefulWidget {
  const FailureGoalPage({Key? key}) : super(key: key);

  @override
  State<FailureGoalPage> createState() => _FailureGoalPageState();
}

class _FailureGoalPageState extends State<FailureGoalPage> {
  late CharacterSettingProvider characterSettingProvider;

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return Scaffold(
      backgroundColor: squirrelCharacter[characterSettingProvider.characterIdx]
          ['character_color'],
      body: SingleChildScrollView(
        child: Column(),
      ),
    );
  }
}
