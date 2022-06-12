import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/widget/success_character_goal_info.dart';

class SuccessCharacterGoalBox extends StatefulWidget {
  final int characterIdx;
  final String characterGoal;
  final String characterStartGoal;
  final String characterEndGoal;
  final double characterGoalSuccessPercent;

  const SuccessCharacterGoalBox({
    Key? key,
    required this.characterIdx,
    required this.characterGoal,
    required this.characterStartGoal,
    required this.characterEndGoal,
    required this.characterGoalSuccessPercent,
  }) : super(key: key);

  @override
  State<SuccessCharacterGoalBox> createState() =>
      _SuccessCharacterGoalBoxState();
}

class _SuccessCharacterGoalBoxState extends State<SuccessCharacterGoalBox> {
  late CharacterSettingProvider characterSettingProvider;
  SwipeActionController swipeActionController = SwipeActionController();

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SuccessCharacterGoalInfoPage(
              characterIdx: widget.characterIdx,
              characterGoal: widget.characterGoal,
              characterStartGoal: widget.characterStartGoal,
              characterEndGoal: widget.characterEndGoal,
              characterGoalSuccessPercent: widget.characterGoalSuccessPercent,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: 388.w,
            height: 138.h,
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            padding: EdgeInsets.only(
              top: 24.h,
              bottom: 23.h,
              left: 34.w,
            ),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.circular(20.w),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x78000000),
                  offset: Offset(0, 5),
                  blurRadius: 15,
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/images/success_goal_character_${widget.characterIdx}.png',
                  width: 103.w,
                  height: 91.h,
                ),
                SizedBox(width: 46.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 22.h,
                      width: 164.w,
                      child: Text(
                        widget.characterGoal,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: const Color.fromRGBO(64, 51, 42, 1),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: 16.h,
                      child: Text(
                        '${widget.characterStartGoal} ~ ${widget.characterEndGoal}',
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: const Color.fromRGBO(64, 51, 42, 1),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      children: [
                        Text(
                          '0',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: squirrelCharacter[characterSettingProvider
                                .characterIdx]['character_color'],
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 130.w,
                          height: 20.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.w),
                            child: SliderTheme(
                              data: SliderThemeData(
                                overlayShape: SliderComponentShape.noOverlay,
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
                                        characterSettingProvider.characterIdx]
                                    ['character_color'],
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '${widget.characterGoalSuccessPercent.floor()}%',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: squirrelCharacter[characterSettingProvider
                                .characterIdx]['character_color'],
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
