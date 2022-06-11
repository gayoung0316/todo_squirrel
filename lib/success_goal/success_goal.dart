import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/widget/failure_character_goal_box.dart';
import 'package:todo_squirrel/widget/success_character_goal_box.dart';

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
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 54.h),
            child: Text(
              '명예의 전당',
              textScaleFactor: 1.0,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromRGBO(255, 255, 255, 1),
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
              ),
            ),
          ),
          SizedBox(height: 35.h),
          SuccessCharacterGoalBox(
            characterIdx: 0,
            characterGoal: '낮잠 안 잘거에요',
            characterStartGoal: '2022.03.04',
            characterEndGoal: '2022.04.14',
            characterGoalSuccessPercent: double.parse('98'),
          ),
          SizedBox(height: 24.h),
          SuccessCharacterGoalBox(
            characterIdx: 1,
            characterGoal: '낮잠 안 자기 >< 낮잠 안 자기낮잠 안 ㅇㄴㄹㅁㄴㅇㄹㅁㄴㅇㄹㅁㄴㅇㄹ자기',
            characterStartGoal: '2022.02.04',
            characterEndGoal: '2022.02.28',
            characterGoalSuccessPercent: double.parse('95'),
          ),
          SizedBox(height: 24.h),
          SuccessCharacterGoalBox(
            characterIdx: 2,
            characterGoal: '물 많이 마셔야지',
            characterStartGoal: '2022.02.04',
            characterEndGoal: '2022.02.17',
            characterGoalSuccessPercent: double.parse('100'),
          ),
          SizedBox(height: 24.h),
          SuccessCharacterGoalBox(
            characterIdx: 3,
            characterGoal: '퇴사 시켜줘',
            characterStartGoal: '2022.02.04',
            characterEndGoal: '2022.02.26',
            characterGoalSuccessPercent: double.parse('97'),
          ),
          SizedBox(height: 24.h),
          SuccessCharacterGoalBox(
            characterIdx: 4,
            characterGoal: '출근 하기',
            characterStartGoal: '2022.05.04',
            characterEndGoal: '2022.05.28',
            characterGoalSuccessPercent: double.parse('90'),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget successGoalListEmptyWidget() {
    return Column(
      children: [
        Container(
          height: 270.h,
          width: 260.w,
          color: Colors.white,
          margin: EdgeInsets.only(top: 190.h),
        ),
        SizedBox(height: 9.h),
        Text(
          '목표를 달성해서\n명예의 전당에 이름을 올려봐!',
          textScaleFactor: 1.0,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color.fromRGBO(255, 255, 255, 1),
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
