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
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);
    homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      backgroundColor: squirrelCharacter[characterSettingProvider.characterIdx]
          ['character_color'],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
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
                child: InkWell(
                  onTap: () {
                    homeProvider.characterGoalCheckController.open();
                  },
                  child: Image.asset(
                    'assets/images/${nowHour >=6 && nowHour < 8 ? 'character_evening_squirrel_' : 'character_select_squirrel_'}${characterSettingProvider.characterIdx}.png',
                    width: 260.w,
                    height: 260.w,
                  ),
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
          ),
        ),
      ),
    );
  }
}
