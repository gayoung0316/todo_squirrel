import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/providers/home_provider.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  late CharacterSettingProvider characterSettingProvider;
  late HomeProvider homeProvider;

  int nowHour = DateTime.now().hour;

  int textlines(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: const Color.fromRGBO(255, 255, 255, 1),
          fontWeight: FontWeight.w800,
          fontSize: 32.sp,
        ),
      ),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout(minWidth: 0, maxWidth: 348.w);

    List<LineMetrics> countLines = textPainter.computeLineMetrics();
    return countLines.length;
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if('${DateTime.now().hour}:${DateTime.now().minute}' == '${characterSettingProvider.characterHour}:${characterSettingProvider.characterMinute}') {
        homeProvider.characterGoalCheckController.open();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);
    homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      backgroundColor: squirrelCharacter[characterSettingProvider.characterIdx]
          ['character_color'],
      body: characterGoal()
    );
  }

  Widget successCharacterGoal() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(height: 175.h),
        Text(
          '축하해!\n명예의 전당에 전시 되었어!',
          textScaleFactor: 1.0,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color.fromRGBO(255, 255, 255, 1),
            fontSize: 32.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 51.h),
        Image.asset(
          'assets/images/success_goal_info_character_${characterSettingProvider.characterIdx}.png',
          width: 180.w,
          height: 200.h,
        ),
        SizedBox(height: 50.h),
        Container(
          width: 316.w,
          height: 60.h,
          margin: EdgeInsets.symmetric(horizontal: 56.w),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(30.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '명예의 전당',
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: squirrelCharacter[characterSettingProvider.characterIdx]['character_color'],
                  fontWeight: FontWeight.w800,
                  fontSize: 24.sp,
                ),
              ),
              Text(
                '으로 가기',
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: const Color.fromRGBO(97, 97, 97, 1),
                  fontWeight: FontWeight.w800,
                  fontSize: 24.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 18.h),
        Container(
          width: 316.w,
          height: 60.h,
          margin: EdgeInsets.symmetric(horizontal: 56.w),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(30.w),
            border: Border.all(
              color: const Color.fromRGBO(255, 255, 255, 1),
              width: 2.w,
            )
          ),
          alignment: Alignment.center,
          child: Text(
            '확인',
            textScaleFactor: 1.0,
            style: TextStyle(
              color: const Color.fromRGBO(255, 255, 255, 1),
              fontWeight: FontWeight.w800,
              fontSize: 24.sp,
            ),
          ),
        )
      ],
    );
  }

  Widget characterGoal() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 91.h),
          child: Image.asset(
            'assets/icons/goal-icon.png',
            width: 40.w,
            height: 40.w,
          ),
        ),
        Column(
          children: [
            Container(
              width: 348.w,
              margin: EdgeInsets.only(top: 50.h),
              alignment: Alignment.center,
              child: Text(
                characterSettingProvider.characterGoal,
                textAlign: TextAlign.center,
                textScaleFactor: 1,
                style: TextStyle(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.w800,
                  fontSize: 32.sp,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: textlines(characterSettingProvider.characterGoal) > 1
                    ? 10.h
                    : 50.h,
              ),
              alignment: Alignment.center,
              child: Text(
                '${DateTime.now().difference(characterSettingProvider.characterStartDate).inDays + 1}일째 도전 중',
                textScaleFactor: 1,
                style: TextStyle(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 91.h),
          child: Image.asset(
            'assets/images/${nowHour >=6 && nowHour < 8 ? 'character_evening_squirrel_' : 'character_select_squirrel_'}${characterSettingProvider.characterIdx}.png',
            width: 260.w,
            height: 260.w,
          ),
        ),
        Container(
          width: 348.w,
          margin: EdgeInsets.only(top: 50.h),
          alignment: Alignment.center,
          child: Text(
            characterSettingProvider.characterName,
            textScaleFactor: 1,
            style: TextStyle(
              color: const Color.fromRGBO(255, 255, 255, 1),
              fontWeight: FontWeight.w800,
              fontSize: 20.sp,
            ),
          ),
        ),
      ],
    );
  }
}
