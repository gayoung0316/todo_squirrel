import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/calender_goal_check_provider.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/providers/goal_list_provider.dart';
import 'package:todo_squirrel/providers/home_provider.dart';
import 'package:todo_squirrel/repositories/todo.dart';

class CalenderGoalCheckMemoPanel extends StatefulWidget {
  const CalenderGoalCheckMemoPanel({Key? key}) : super(key: key);

  @override
  State<CalenderGoalCheckMemoPanel> createState() =>
      _CalenderGoalCheckMemoPanelState();
}

class _CalenderGoalCheckMemoPanelState
    extends State<CalenderGoalCheckMemoPanel> {
  late CalenderGoalCheckProvider calenderGoalCheckProvider;
  late CharacterSettingProvider characterSettingProvider;
  late GoalListProvider goalListProvider;
  late HomeProvider homeProvider;
  final ToDo _toDo = ToDo();

  @override
  Widget build(BuildContext context) {
    calenderGoalCheckProvider = Provider.of<CalenderGoalCheckProvider>(context);
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);
    goalListProvider = Provider.of<GoalListProvider>(context);
    homeProvider = Provider.of<HomeProvider>(context);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        calenderGoalCheckProvider.goalMemoTextFieldTapped = false;
      },
      child: ListView(
        padding: EdgeInsets.only(
          top: 23.h,
          left: 40.w,
          right: 47.w,
        ),
        physics: const BouncingScrollPhysics(),
        children: [
          Text(
            calenderGoalCheckProvider.goalCheckDay.contains('-')
                ? '${calenderGoalCheckProvider.goalCheckDay.split('-')[1]}월 ${calenderGoalCheckProvider.goalCheckDay.split('-')[2]}일'
                : calenderGoalCheckProvider.goalCheckDay,
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
              color: const Color.fromRGBO(97, 97, 97, 1),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            '도전 여부',
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(112, 112, 112, 1),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              InkWell(
                onTap: () {
                  _toDo.setCalenderGoal(
                      todoIdx: characterSettingProvider.todoListIdx,
                      date: calenderGoalCheckProvider.goalCheckDay);

                  calenderGoalCheckProvider.goalCheckSuccess = 1;
                  goalListProvider.calenderCheckGoalList[
                          calenderGoalCheckProvider.goalCheckListIdx]
                      ['success'] = 1;
                },
                child: Container(
                  width: 80.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: calenderGoalCheckProvider.goalCheckSuccess == 1
                        ? squirrelCharacter[characterSettingProvider
                            .characterIdx]['character_color']
                        : const Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(35.w),
                    border: Border.all(
                      color: squirrelCharacter[characterSettingProvider
                          .characterIdx]['character_color'],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '수행',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: calenderGoalCheckProvider.goalCheckSuccess == 1
                          ? const Color.fromRGBO(255, 255, 255, 1)
                          : const Color.fromRGBO(158, 158, 158, 1),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              InkWell(
                onTap: () {
                  _toDo.deleteCalenderGoal(
                      todoIdx: characterSettingProvider.todoListIdx,
                      date: calenderGoalCheckProvider.goalCheckDay);

                  calenderGoalCheckProvider.goalCheckSuccess = 0;
                  goalListProvider.calenderCheckGoalList[
                          calenderGoalCheckProvider.goalCheckListIdx]
                      ['success'] = 0;
                },
                child: Container(
                  width: 80.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    color: calenderGoalCheckProvider.goalCheckSuccess == 0
                        ? squirrelCharacter[characterSettingProvider
                            .characterIdx]['character_color']
                        : const Color.fromRGBO(255, 255, 255, 1),
                    borderRadius: BorderRadius.circular(35.w),
                    border: Border.all(
                      color: squirrelCharacter[characterSettingProvider
                          .characterIdx]['character_color'],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '미수행',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: calenderGoalCheckProvider.goalCheckSuccess == 0
                          ? const Color.fromRGBO(255, 255, 255, 1)
                          : const Color.fromRGBO(158, 158, 158, 1),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Text(
            '한줄일기',
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(112, 112, 112, 1),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            width: 341.w,
            height: 66.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.w),
              border: Border.all(
                color: calenderGoalCheckProvider.goalMemoController.text.isEmpty
                    ? const Color.fromRGBO(112, 112, 112, 0.5)
                    : squirrelCharacter[characterSettingProvider.characterIdx]
                        ['character_color'],
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 300.w,
                  child: TextField(
                    focusNode: calenderGoalCheckProvider.goalMemoFocusNode,
                    controller: calenderGoalCheckProvider.goalMemoController,
                    maxLines: null,
                    style: TextStyle(
                      color: const Color.fromRGBO(33, 33, 33, 1),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      setState(() {});
                    },
                    onSubmitted: (value) {
                      calenderGoalCheckProvider.goalMemoTextFieldTapped = false;
                    },
                    onTap: () {
                      calenderGoalCheckProvider.goalMemoTextFieldTapped = true;
                    },
                    decoration: InputDecoration(
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(10.w),
                      counterText: '',
                      hintStyle: TextStyle(
                        color: const Color.fromRGBO(158, 158, 158, 1),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: '한줄을 남겨보세요',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        if (goalListProvider.calenderCheckGoalList[
                                    calenderGoalCheckProvider.goalCheckListIdx]
                                ['memo'] ==
                            "") {
                          if (calenderGoalCheckProvider.goalMemoController.text
                              .trim()
                              .isNotEmpty) {
                            var result = await _toDo.postToDoMemo(
                              todoIdx: characterSettingProvider.todoListIdx,
                              date: calenderGoalCheckProvider.goalCheckDay,
                              memo: calenderGoalCheckProvider
                                  .goalMemoController.text,
                            );

                            if (result!.data['success']) {
                              goalListProvider.calenderCheckGoalList[
                                      calenderGoalCheckProvider
                                          .goalCheckListIdx]['memo'] =
                                  calenderGoalCheckProvider
                                      .goalMemoController.text;
                              calenderGoalCheckProvider.goalMemoController
                                  .clear();
                              homeProvider.calenderGoalCheckController.close();
                            }
                          }
                        } else {
                          if (calenderGoalCheckProvider.goalMemoController.text
                              .trim()
                              .isNotEmpty) {
                            var result = await _toDo.editToDoMemo(
                              todoIdx: characterSettingProvider.todoListIdx,
                              date: calenderGoalCheckProvider.goalCheckDay,
                              memo: calenderGoalCheckProvider
                                  .goalMemoController.text,
                            );

                            if (result!.data['success']) {
                              goalListProvider.calenderCheckGoalList[
                                      calenderGoalCheckProvider
                                          .goalCheckListIdx]['memo'] =
                                  calenderGoalCheckProvider
                                      .goalMemoController.text;
                              calenderGoalCheckProvider.goalMemoController
                                  .clear();
                              homeProvider.calenderGoalCheckController.close();
                            }
                          }
                        }
                      },
                      child: Image.asset(
                        'assets/icons/memo-upload.png',
                        width: 23.w,
                        height: 23.w,
                        color: calenderGoalCheckProvider
                                .goalMemoController.text.isNotEmpty
                            ? squirrelCharacter[characterSettingProvider
                                .characterIdx]['character_color']
                            : null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
