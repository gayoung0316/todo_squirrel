import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';

class FailureGoalInfoPage extends StatefulWidget {
  final String characterStartGoal;
  final String characterEndGoal;
  final String characterGoal;
  final double characterGoalSuccessPercent;

  const FailureGoalInfoPage({
    Key? key,
    required this.characterGoal,
    required this.characterStartGoal,
    required this.characterEndGoal,
    required this.characterGoalSuccessPercent,
  }) : super(key: key);

  @override
  State<FailureGoalInfoPage> createState() => _FailureGoalInfoPageState();
}

class _FailureGoalInfoPageState extends State<FailureGoalInfoPage> {
  late CharacterSettingProvider characterSettingProvider;

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return Scaffold(
      backgroundColor: squirrelCharacter[characterSettingProvider.characterIdx]
          ['failure_backcolor'],
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 57.h, left: 20.w, right: 20.w),
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
          SizedBox(height: 36.h),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 440.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(52.w),
                      topRight: Radius.circular(52.w),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x77000000),
                        offset: const Offset(0, 5),
                        blurRadius: 15.w,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 30.w,
                      right: 20.w,
                      top: 61.h,
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        SizedBox(
                          height: 14.h,
                          child: Text(
                            '이름',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color.fromRGBO(102, 102, 102, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          height: 22.h,
                          child: Text(
                            '토리',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: const Color.fromRGBO(64, 51, 42, 1),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        SizedBox(
                          height: 14.h,
                          child: Text(
                            '목표',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color.fromRGBO(102, 102, 102, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          height: 22.h,
                          child: Text(
                            widget.characterGoal,
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: const Color.fromRGBO(64, 51, 42, 1),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        SizedBox(
                          height: 14.h,
                          child: Text(
                            '시각 날짜, 종료 날짜',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color.fromRGBO(102, 102, 102, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                        SizedBox(
                          height: 22.h,
                          child: Text(
                            '${widget.characterStartGoal}~${widget.characterEndGoal}',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 20.sp,
                              color: const Color.fromRGBO(64, 51, 42, 1),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        SizedBox(
                          height: 14.h,
                          child: Text(
                            '목표 달성률',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color.fromRGBO(102, 102, 102, 1),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 31.h),
                        Row(
                          children: [
                            Text(
                              '0',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: squirrelCharacter[
                                        characterSettingProvider.characterIdx]
                                    ['character_color'],
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            SizedBox(
                              width: 290.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.w),
                                child: SliderTheme(
                                  data: SliderThemeData(
                                    overlayShape:
                                        SliderComponentShape.noOverlay,
                                    thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 8.w,
                                    ),
                                  ),
                                  child: Slider(
                                    min: 0,
                                    max: 100,
                                    value: widget.characterGoalSuccessPercent,
                                    inactiveColor:
                                        const Color.fromRGBO(223, 223, 223, 1),
                                    activeColor: squirrelCharacter[
                                        characterSettingProvider
                                            .characterIdx]['character_color'],
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              '${widget.characterGoalSuccessPercent.floor()}%',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: squirrelCharacter[
                                        characterSettingProvider.characterIdx]
                                    ['character_color'],
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 303.w,
                              height: 49.h,
                              decoration: BoxDecoration(
                                color: squirrelCharacter[
                                        characterSettingProvider.characterIdx]
                                    ['character_color'],
                                borderRadius: BorderRadius.circular(20.w),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: const Offset(1, 2),
                                    blurRadius: 5.w,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/goal-retry.png',
                                    width: 22.w,
                                    height: 22.w,
                                  ),
                                  SizedBox(width: 9.w),
                                  Text(
                                    '목표 재도전',
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 61.w,
                              height: 50.h,
                              margin: EdgeInsets.only(left: 14.w),
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.circular(20.w),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0x29000000),
                                    offset: const Offset(1, 2),
                                    blurRadius: 5.w,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18.w, vertical: 12.h),
                              child: Image.asset(
                                'assets/icons/goal-delete.png',
                                width: 25.w,
                                height: 25.w,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Image.asset(
                    'assets/images/failure_goal_info_character_3.png',
                    width: 250.w,
                    height: 415.h,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
