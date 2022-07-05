import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_squirrel/model/month.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/providers/calender_goal_check_provider.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/providers/goal_list_provider.dart';
import 'package:todo_squirrel/providers/home_provider.dart';
import 'package:todo_squirrel/screens/calender_goal/calender_goal_list.dart';

import 'calender_goal_check_memo.dart';

class CalenderGoalPage extends StatefulWidget {
  const CalenderGoalPage({Key? key}) : super(key: key);

  @override
  State<CalenderGoalPage> createState() => _CalenderGoalPageState();
}

class _CalenderGoalPageState extends State<CalenderGoalPage> {
  late CharacterSettingProvider characterSettingProvider;
  late HomeProvider homeProvider;
  late GoalListProvider goalListProvider;
  late CalenderGoalCheckProvider calenderGoalCheckProvider;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read<GoalListProvider>().setCharacterGoalCalenderList();
    });
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);
    homeProvider = Provider.of<HomeProvider>(context);
    goalListProvider = Provider.of<GoalListProvider>(context);
    calenderGoalCheckProvider = Provider.of<CalenderGoalCheckProvider>(context);

    return Scaffold(
      backgroundColor: squirrelCharacter[characterSettingProvider.characterIdx]['character_color'],
      body: Stack(
        children: [
          calenderWidget(),
          
          SlidingUpPanel(
            backdropEnabled: true,
            controller: homeProvider.goalListController,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.w),
              topRight: Radius.circular(35.w),
            ),
            onPanelOpened: () {
              calenderGoalCheckProvider.goalListIsPanelOpen = true;
            },
            onPanelClosed: () {
              calenderGoalCheckProvider.goalListIsPanelOpen = false;
            },
            minHeight: 59.h,
            maxHeight: (goalListProvider.calenderGoalList.length * 100.h) + 60.h,
            backdropOpacity: 0,
            panel: const CalenderGoalListPanel(),
          ),
          SlidingUpPanel(
            backdropEnabled: true,
            controller: homeProvider.calenderGoalCheckController,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.w),
              topRight: Radius.circular(35.w),
            ),
            onPanelClosed: () {
              calenderGoalCheckProvider.goalMemoController.clear();
              FocusScope.of(context).unfocus();
            },
            minHeight: 0.h,
            maxHeight: 260.h,
            backdropOpacity: 0,
            panel: const CalenderGoalCheckMemoPanel(),
          ),
        ],
      ),
    );
  }

  Widget calenderWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 53.h, left: 30.w, right: 30.w),
      child: TableCalendar(
        rowHeight: 58.h,
        daysOfWeekHeight: 50.h,
        daysOfWeekStyle: DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
            color: const Color.fromRGBO(224, 224, 224, 1),
          ),
          weekendStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
            color: const Color.fromRGBO(224, 224, 224, 1),
          ),
          dowTextFormatter: (date, locale) {
            return DateFormat.E(locale).format(date)[0];
          },
        ),
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          leftChevronVisible: false,
          rightChevronVisible: false,
          titleCentered: true,
        ),
        calendarBuilders: CalendarBuilders(
          headerTitleBuilder: (context, day) {
            return Column(
              children: [
                Text(
                  month[day.month - 1],
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(
                  day.year.toString(),
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            );
          },
          defaultBuilder: (context, day, focusedDay) {
            return Visibility(
              visible: goalListProvider.calenderCheckGoalList.where((element) => element['date'] == day.toString().split(' ')[0]).toList().isEmpty,
              child: Center(
                child: Text(
                  day.day.toString(),
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ),
            );
          },
          todayBuilder: (context, day, focusedDay) {
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: 4.w,
                  height: 4.w,
                  margin: EdgeInsets.only(top: 4.h),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    shape: BoxShape.circle,
                  ),
                ),
                Center(
                  child: Text(
                    goalListProvider.calenderCheckGoalList.where(
                      (element) => element['date'].toString().split(' ')[0] == day.toString().split(' ')[0]
                    ).toList().isNotEmpty
                    ? ''
                    : day.day.toString(),
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ),
              ],
            );
          },
          markerBuilder: (context, day, events) {
            return Stack(
              children: [
                ...goalListProvider.calenderCheckGoalList.map((e) {
                  return InkWell(
                    onTap: () {
                      calenderGoalCheckProvider.goalCheckListIdx = goalListProvider.calenderCheckGoalList.indexOf(e);
                      calenderGoalCheckProvider.goalCheckDay = day.toString().split(' ')[0];
                      calenderGoalCheckProvider.goalCheckSuccess = e['success'];
                      homeProvider.calenderGoalCheckController.open();
                    },
                    child: Visibility(
                      visible: e['date'].toString().split(' ')[0] == day.toString().split(' ')[0],
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: Container(
                              alignment: Alignment.center,
                              width: 30.w,
                              height: 30.w,
                              decoration: BoxDecoration(
                                color: e['success'] == 1 ? const Color.fromRGBO(255, 255, 255, 1) : Colors.transparent,
                                borderRadius: BorderRadius.circular(12.w),
                                border: Border.all(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  width: 1.w,
                                ),
                                shape: BoxShape.rectangle,
                              ),
                              child: Text(
                                day.day.toString(),
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w800,
                                  color: e['success'] == 1 ? squirrelCharacter[characterSettingProvider.characterIdx]['character_color']
                                  : const Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: e['success'] == 0,
                            child: Image.asset(
                              'assets/icons/diagonal-line.png',
                              width: 22.5.w,
                              height: 22.5.w,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ],
            );
          },
        ),
        // 기본 포맷
        calendarFormat: CalendarFormat.month,
        // 시작 날짜
        firstDay: DateTime.utc(2000, 1, 1),
        // 마지막 날짜
        lastDay: DateTime.utc(2100, 12, 31),
        // 포커스 될 날짜
        focusedDay: DateTime.now(),
        calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          cellMargin: EdgeInsets.zero,
          cellPadding: EdgeInsets.zero,
          rangeHighlightColor: Colors.transparent,
          todayTextStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w800,
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
          defaultTextStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w800,
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
          weekendTextStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w800,
            color: const Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      ),
    );
  }
}
