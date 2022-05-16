import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/widget/failure_character_box.dart';

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
          ['failure_backcolor'],
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 94.h,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/icons/spider-web.png',
                    height: 94.h,
                    width: 141.w,
                  ),
                ),
                Positioned(
                  top: 57.h,
                  left: 20.w,
                  right: 20.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Image.asset(
                          'assets/icons/arrow_left.png',
                          width: 24.w,
                          height: 24.w,
                        ),
                      ),
                      Text(
                        '우울한 숲',
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        width: 24.w,
                        height: 24.w,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 26.h),
          FailureCharacterBox(
            characterIdx: 0,
            characterGoal: '낮잠 안 자기',
            characterStartGoal: '2022.02.04',
            characterEndGoal: '2022.02.14',
            characterGoalSuccessPercent: double.parse('30'),
          ),
          SizedBox(height: 24.h),
          FailureCharacterBox(
            characterIdx: 2,
            characterGoal: '낮잠 안 자기낮잠 안 자기낮잠 안 자기',
            characterStartGoal: '2022.02.04',
            characterEndGoal: '2022.02.14',
            characterGoalSuccessPercent: double.parse('70'),
          ),
          SizedBox(height: 24.h),
          FailureCharacterBox(
            characterIdx: 3,
            characterGoal: '물 많이 마시기',
            characterStartGoal: '2022.02.04',
            characterEndGoal: '2022.02.14',
            characterGoalSuccessPercent: double.parse('90'),
          ),
          SizedBox(height: 24.h),
          FailureCharacterBox(
            characterIdx: 4,
            characterGoal: '퇴사 하기',
            characterStartGoal: '2022.02.04',
            characterEndGoal: '2022.02.14',
            characterGoalSuccessPercent: double.parse('45'),
          ),
          SizedBox(height: 24.h),
          FailureCharacterBox(
            characterIdx: 4,
            characterGoal: '출근 하기',
            characterStartGoal: '2022.02.04',
            characterEndGoal: '2022.02.14',
            characterGoalSuccessPercent: double.parse('15'),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
