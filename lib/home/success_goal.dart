import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_squirrel/model/squirrel_Character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';

class SuccessGoalPage extends StatefulWidget {
  const SuccessGoalPage({Key? key}) : super(key: key);

  @override
  State<SuccessGoalPage> createState() => _SuccessGoalPageState();
}

class _SuccessGoalPageState extends State<SuccessGoalPage> {
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
