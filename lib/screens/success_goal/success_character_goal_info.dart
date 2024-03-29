import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';

class SuccessCharacterGoalInfoPage extends StatefulWidget {
  final int characterIdx;
  final String characterStartGoal;
  final String characterEndGoal;
  final String characterGoal;
  final double characterGoalSuccessPercent;

  const SuccessCharacterGoalInfoPage({
    Key? key,
    required this.characterIdx,
    required this.characterGoal,
    required this.characterStartGoal,
    required this.characterEndGoal,
    required this.characterGoalSuccessPercent,
  }) : super(key: key);

  @override
  State<SuccessCharacterGoalInfoPage> createState() =>
      _SuccessCharacterGoalInfoPageState();
}

class _SuccessCharacterGoalInfoPageState
    extends State<SuccessCharacterGoalInfoPage> {
  late CharacterSettingProvider characterSettingProvider;

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return Scaffold(
      backgroundColor: squirrelCharacter[widget.characterIdx]['character_color'],
      body: Stack(
        children: [
          Positioned(
            top: -10.h,
            child: Image.asset(
              'assets/images/success_charact_info_back.png',
              height: 668.h,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Column(
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
                      '명예의 전당',
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
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        children: [
                          SizedBox(height: 61.h),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
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
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
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
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
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
                          Padding(
                            padding: EdgeInsets.only(left: 30.w, right: 20.w),
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
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
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
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
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
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
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
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
                            child: Row(
                              children: [
                                Text(
                                  '0',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    color: squirrelCharacter[
                                        characterSettingProvider
                                            .characterIdx]['character_color'],
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                SizedBox(
                                  width: 290.w,
                                  height: 22.h,
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
                                        value:
                                            widget.characterGoalSuccessPercent,
                                        inactiveColor: const Color.fromRGBO(
                                            223, 223, 223, 1),
                                        activeColor: squirrelCharacter[
                                                characterSettingProvider
                                                    .characterIdx]
                                            ['character_color'],
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
                                        characterSettingProvider
                                            .characterIdx]['character_color'],
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 70.h,
                      child: Image.asset(
                        'assets/images/success_goal_info_character_${widget.characterIdx}.png',
                        width: 280.w,
                        height: 316.h,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
