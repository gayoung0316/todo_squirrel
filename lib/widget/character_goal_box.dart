import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:flutter_swipe_action_cell/core/controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/widget/character_goal_info.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';

class CharacterGoalBox extends StatefulWidget {
  final bool isFailGoalCharacter;
  final int characterIdx;
  final String characterGoal;
  final String characterStartGoal;
  final String characterEndGoal;
  final double characterGoalSuccessPercent;

  const CharacterGoalBox({
    Key? key,
    this.isFailGoalCharacter = false,
    required this.characterIdx,
    required this.characterGoal,
    required this.characterStartGoal,
    required this.characterEndGoal,
    required this.characterGoalSuccessPercent,
  }) : super(key: key);

  @override
  State<CharacterGoalBox> createState() => _CharacterGoalBoxState();
}

class _CharacterGoalBoxState extends State<CharacterGoalBox> {
  late CharacterSettingProvider characterSettingProvider;
  SwipeActionController swipeActionController = SwipeActionController();

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return SwipeActionCell(
      key: ValueKey(widget.characterIdx),
      controller: swipeActionController,
      backgroundColor: Colors.transparent,
      trailingActions: <SwipeAction>[
        SwipeAction(
          onTap: (CompletionHandler handler) async {},
          widthSpace: 22.w,
          color: Colors.transparent,
        ),
        SwipeAction(
          onTap: (CompletionHandler handler) async {
            swipeActionController.closeAllOpenCell();
            showDialog(
              barrierColor: const Color.fromRGBO(7, 6, 6, 0.5),
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  content: Container(
                    width: 296.w,
                    height: 171.h,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 24.h),
                          child: Image.asset(
                            'assets/images/character_squirrel_mini_${characterSettingProvider.characterIdx}.png',
                            width: 60.w,
                            height: 60.w,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          '안돼! 지금 목표에 집중해',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: const Color.fromRGBO(97, 97, 97, 1),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 7.h),
                        Text(
                          '* 도전중에는 한개의 목표만 가능',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: const Color.fromRGBO(158, 158, 158, 1),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          widthSpace: 44.w,
          content: Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(1, 2),
                  blurRadius: 5,
                  spreadRadius: 0,
                ),
              ],
              borderRadius: BorderRadius.circular(10.w),
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
            child: const Icon(
              Icons.face,
              color: Colors.black,
            ),
          ),
          color: Colors.transparent,
        ),
        SwipeAction(
          onTap: (CompletionHandler handler) async {},
          widthSpace: 10.w,
          color: Colors.transparent,
        ),
        SwipeAction(
          onTap: (CompletionHandler handler) async {
            swipeActionController.closeAllOpenCell();
            showDialog(
              barrierColor: const Color.fromRGBO(7, 6, 6, 0.5),
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  content: Container(
                    width: 296.w,
                    height: 224.h,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(20.w),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 24.h),
                          child: Image.asset(
                            'assets/images/character_squirrel_mini_${characterSettingProvider.characterIdx}.png',
                            width: 60.w,
                            height: 60.w,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          '다시 해볼거야?',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: const Color.fromRGBO(97, 97, 97, 1),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 7.h),
                        Text(
                          '* 그때 세웠던 설정대로 시작할 수 있어',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: const Color.fromRGBO(158, 158, 158, 1),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                swipeActionController.closeAllOpenCell();
                              },
                              child: Container(
                                width: 112.w,
                                height: 48.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(24.w),
                                  border: Border.all(
                                    width: 2.w,
                                    color: squirrelCharacter[
                                        characterSettingProvider
                                            .characterIdx]['character_color'],
                                  ),
                                ),
                                child: Text(
                                  '응!',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    color: const Color.fromRGBO(97, 97, 97, 1),
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            InkWell(
                              onTap: () {
                                swipeActionController.closeAllOpenCell();
                              },
                              child: Container(
                                width: 112.w,
                                height: 48.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(24.w),
                                  border: Border.all(
                                    width: 2.w,
                                    color: squirrelCharacter[
                                        characterSettingProvider
                                            .characterIdx]['character_color'],
                                  ),
                                ),
                                child: Text(
                                  '아니',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    color: const Color.fromRGBO(97, 97, 97, 1),
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          widthSpace: 44.w,
          content: Container(
            width: 44.w,
            height: 44.w,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(1, 2),
                  blurRadius: 5,
                  spreadRadius: 0,
                ),
              ],
              borderRadius: BorderRadius.circular(10.w),
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
            child: const Icon(
              Icons.favorite,
              color: Colors.black,
            ),
          ),
          color: Colors.transparent,
        ),
      ],
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FailureGoalInfoPage(
                isFailureGoal: widget.isFailGoalCharacter,
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
                    'assets/images/${widget.isFailGoalCharacter ? 'failure_character' : 'success_goal_character'}_${widget.characterIdx}.png',
                    width: widget.isFailGoalCharacter ? 100.w : 103.w,
                    height: widget.isFailGoalCharacter ? 100.w : 91.h,
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
      ),
    );
  }
}
