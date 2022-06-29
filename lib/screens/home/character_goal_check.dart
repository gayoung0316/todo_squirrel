import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/providers/home_provider.dart';

class CharacterGoalCheck extends StatefulWidget {
  const CharacterGoalCheck({Key? key}) : super(key: key);

  @override
  State<CharacterGoalCheck> createState() => _CharacterGoalCheckState();
}

class _CharacterGoalCheckState extends State<CharacterGoalCheck> {
  late HomeProvider homeProvider;
  late CharacterSettingProvider characterSettingProvider;

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context);
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return SlidingUpPanel(
      backdropEnabled: true,
      controller: homeProvider.characterGoalCheckController,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35.w),
        topRight: Radius.circular(35.w),
      ),
      minHeight: 0,
      maxHeight: 333.h,
      panel: Column(
        children: [
          SizedBox(height: 40.h),
          Image.asset(
            'assets/images/character_squirrel_mini_${characterSettingProvider.characterIdx}.png',
            width: 60.w,
            height: 60.w,
          ),
          SizedBox(height: 20.h),
          Container(
            width: 388.w,
            alignment: Alignment.center,
            margin: EdgeInsets.only(bottom: 10.h, left: 20.w, right: 20.w),
            child: Text(
              characterSettingProvider.characterGoal,
              textScaleFactor: 1.0,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromRGBO(97, 97, 97, 1),
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Text(
            '오늘 목표를 도전했니?',
            textScaleFactor: 1.0,
            style: TextStyle(
              color: const Color.fromRGBO(97, 97, 97, 1),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 26.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  homeProvider.characterGoalCheckController
                      .close()
                      .then((value) {
                    homeProvider.isButtonTapped = false;
                  });
                },
                child: Container(
                  width: 121.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: squirrelCharacter[characterSettingProvider
                          .characterIdx]['character_color'],
                      width: 2.w,
                    ),
                    borderRadius: BorderRadius.circular(26.w),
                    color: homeProvider.isButtonTapped
                        ? squirrelCharacter[characterSettingProvider
                            .characterIdx]['character_color']
                        : Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '미안해..',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: homeProvider.isButtonTapped
                          ? const Color.fromRGBO(255, 255, 255, 1)
                          : const Color.fromRGBO(97, 97, 97, 1),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              InkWell(
                onTap: () {
                  homeProvider.characterGoalCheckController
                      .close()
                      .then((value) {
                    homeProvider.isButtonTapped = false;
                  });
                },
                child: Container(
                  width: 121.w,
                  height: 52.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: squirrelCharacter[characterSettingProvider
                          .characterIdx]['character_color'],
                      width: 2.w,
                    ),
                    borderRadius: BorderRadius.circular(26.w),
                    color: homeProvider.isButtonTapped
                        ? squirrelCharacter[characterSettingProvider
                            .characterIdx]['character_color']
                        : Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '응!',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: homeProvider.isButtonTapped
                          ? const Color.fromRGBO(255, 255, 255, 1)
                          : const Color.fromRGBO(97, 97, 97, 1),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
