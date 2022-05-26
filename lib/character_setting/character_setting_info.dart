import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_squirrel/components/triangle_clipper.dart';
import 'package:todo_squirrel/home/home_screen.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/providers/home_provider.dart';

class CharacterSettingInfo extends StatefulWidget {
  const CharacterSettingInfo({Key? key}) : super(key: key);

  @override
  State<CharacterSettingInfo> createState() => _CharacterSettingInfoState();
}

class _CharacterSettingInfoState extends State<CharacterSettingInfo> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late CharacterSettingProvider characterSettingProvider;
  late HomeProvider homeProvider;

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);
    // homeProvider = Provider.of<HomeProvider>(context);
    homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      backgroundColor: squirrelCharacter[characterSettingProvider.characterIdx]
          ['character_color'],
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 57.h, left: 20.w),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  'assets/icons/arrow_left.png',
                  width: 24.w,
                  height: 24.w,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: 70.h),
                SizedBox(
                  height: 52.h,
                  child: Stack(
                    children: [
                      Container(
                        width: 308.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.w),
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '“ 안녕 난 ${characterSettingProvider.characterName}야 잘 부탁해! “',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: squirrelCharacter[characterSettingProvider
                                .characterIdx]['character_color'],
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 46.w,
                        child: ClipPath(
                          clipper: TriangleClipper(),
                          child: Container(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            height: 12.w,
                            width: 12.w,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 38.h),
                Image.asset(
                  'assets/images/character_select_squirrel_${characterSettingProvider.characterIdx}.png',
                  width: 284.w,
                  height: 284.w,
                ),
                SizedBox(height: 30.h),
                characterInfo(
                  title: '이름',
                  content: characterSettingProvider.characterName,
                ),
                SizedBox(height: 34.h),
                characterInfo(
                  title: '목표',
                  content: characterSettingProvider.characterGoal,
                ),
                SizedBox(height: 34.h),
                characterInfo(
                    title: '날짜',
                    content:
                        '${characterSettingProvider.characterStartDate.toString().split(' ')[0].replaceAll('-', '.')}~${characterSettingProvider.characterEndDate.toString().split(' ')[0].replaceAll('-', '.')}'),
                SizedBox(height: 34.h),
                characterInfo(
                  title: '알람',
                  content:
                      '${characterSettingProvider.characterHour == 0 ? '00' : characterSettingProvider.characterHour}:${characterSettingProvider.characterMinute == 0 ? '00' : characterSettingProvider.characterMinute}',
                ),
                SizedBox(height: 41.h),
                InkWell(
                  onTap: () async {
                    final SharedPreferences prefs = await _prefs;
                    final bool isShowCoachMarks = prefs.getBool('isShowCoachMarks') ?? true;

                    if(isShowCoachMarks) {
                      prefs.setBool('isShowCoachMarks', true);
                      homeProvider.isShowCoachMarks = true;
                      homeProvider.coachMarksNumber = 1;
                    }

                    homeProvider.pageIdx = 2;
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreenPage(),
                      ),
                      (route) => false,
                    );
                  },
                  child: Container(
                    width: 112.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(21.w),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '시작하기',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        color: squirrelCharacter[characterSettingProvider
                            .characterIdx]['character_color'],
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget characterInfo({required String title, required String content}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 90.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textScaleFactor: 1.0,
            style: TextStyle(
              color: const Color.fromRGBO(255, 255, 255, 1),
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(width: 30.w),
          SizedBox(
            width: 180.w,
            child: Text(
              content,
              textScaleFactor: 1.0,
              style: TextStyle(
                color: const Color.fromRGBO(255, 255, 255, 1),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                height: 1.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
