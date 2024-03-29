import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/providers/goal_list_provider.dart';

import 'failure_character_goal_box.dart';

class FailureGoalPage extends StatefulWidget {
  const FailureGoalPage({Key? key}) : super(key: key);

  @override
  State<FailureGoalPage> createState() => _FailureGoalPageState();
}

class _FailureGoalPageState extends State<FailureGoalPage> {
  late CharacterSettingProvider characterSettingProvider;
  late GoalListProvider goalListProvider;

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);
    goalListProvider = Provider.of<GoalListProvider>(context);

    return Scaffold(
      backgroundColor: squirrelCharacter[characterSettingProvider.characterIdx]
          ['failure_color'],
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 100.h),
        children: [
          SizedBox(
            height: 110.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: -20.h,
                  right: -14.w,
                  child: Image.asset(
                    'assets/icons/spider-web.png',
                    height: 139.h,
                    width: 115.w,
                  ),
                ),
                Positioned(
                  top: 57.h,
                  child: SizedBox(
                    height: 31.h,
                    child: Text(
                      '우울한 숲',
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          goalListProvider.failureGoalList.isEmpty
              ? failureGoalListEmptyWidget()
              : Column(
                  children: [
                    SizedBox(height: 15.h),
                    ...goalListProvider.failureGoalList.map((item) {
                      return FailureCharacterGoalBox(
                        characterIdx: item['char'],
                        characterGoal: item['goal'],
                        characterStartGoal:
                            item['created_at'].split('T')[0].replace('-', '.'),
                        characterEndGoal:
                            item['finish_date'].split('T')[0].replace('-', '.'),
                        characterGoalSuccessPercent: double.parse('30'),
                        characterName: item['name'],
                      );
                    }),
                  ],
                )
        ],
      ),
    );
  }

  Widget failureGoalListEmptyWidget() {
    return Column(
      children: [
        SizedBox(height: 190.h),
        Image.asset(
          'assets/images/failure-goal-list-empty.png',
          width: 206.w,
          height: 202.h,
        ),
        SizedBox(height: 26.h),
        Text(
          '소중한 아이들을\n우울한 숲으로 보내지 말아 줘!',
          textScaleFactor: 1.0,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color.fromRGBO(255, 255, 255, 1),
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
