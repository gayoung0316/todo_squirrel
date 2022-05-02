import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';

class CalenderGoalPage extends StatefulWidget {
  const CalenderGoalPage({Key? key}) : super(key: key);

  @override
  State<CalenderGoalPage> createState() => _CalenderGoalPageState();
}

class _CalenderGoalPageState extends State<CalenderGoalPage> {
  late CharacterSettingProvider characterSettingProvider;
  List<Map> list = [
    {
      'dateTime': DateTime(2022, 5, 2),
      'success': false,
    },
    {
      'dateTime': DateTime(2022, 5, 3),
      'success': false,
    },
    {
      'dateTime': DateTime(2022, 5, 4),
      'success': true,
    },
    {
      'dateTime': DateTime(2022, 5, 5),
      'success': true,
    },
    {
      'dateTime': DateTime(2022, 5, 6),
      'success': false,
    },
    {
      'dateTime': DateTime(2022, 5, 7),
      'success': false,
    },
    {
      'dateTime': DateTime(2022, 5, 8),
      'success': false,
    },
    {
      'dateTime': DateTime(2022, 5, 9),
      'success': false,
    },
    {
      'dateTime': DateTime(2022, 5, 10),
      'success': false,
    },
    {
      'dateTime': DateTime(2022, 5, 22),
      'success': false,
    },
    {
      'dateTime': DateTime(2022, 5, 23),
      'success': true,
    },
    {
      'dateTime': DateTime(2022, 5, 24),
      'success': true,
    },
    {
      'dateTime': DateTime(2022, 5, 25),
      'success': false,
    },
    {
      'dateTime': DateTime(2022, 5, 26),
      'success': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return Scaffold(
      backgroundColor: squirrelCharacter[characterSettingProvider.characterIdx]
          ['character_color'],
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Positioned(
                top: 60.h,
                left: 20.w,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    'assets/icons/arrow_left.png',
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
              ),
              calenderWidget(),
            ],
          )
        ],
      ),
    );
  }

  Widget calenderWidget() {
    return Padding(
      padding: EdgeInsets.only(top: 53.h, left: 30.w, right: 30.w),
      child: TableCalendar(
        // 날짜 한 칸이 자지하는 크기
        rowHeight: 58.h,
        // 요일 칸이 차지하는 크기
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
          defaultBuilder: (context, day, focusedDay) {
            return Visibility(
              visible: list
                  .where((element) =>
                      element['dateTime'].toString().split(' ')[0] ==
                      day.toString().split(' ')[0])
                  .toList()
                  .isEmpty,
              child: Center(
                child: Text(
                  day.day.toString(),
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,
                    // color: Colors.transparent,
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
                    list
                            .where((element) =>
                                element['dateTime'].toString().split(' ')[0] ==
                                day.toString().split(' ')[0])
                            .toList()
                            .isNotEmpty
                        ? ''
                        : day.day.toString(),
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      // color: Colors.transparent,
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
                ...list.map((e) {
                  return Visibility(
                    visible: e['dateTime'].toString().split(' ')[0] ==
                        day.toString().split(' ')[0],
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: 30.w,
                        height: 30.w,
                        decoration: BoxDecoration(
                          color: e['success']
                              ? const Color.fromRGBO(255, 255, 255, 1)
                              : const Color.fromRGBO(255, 255, 255, 0.3),
                          borderRadius: BorderRadius.circular(12.w),
                          shape: BoxShape.rectangle,
                        ),
                        child: Text(
                          day.day.toString(),
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w800,
                            color: e['success']
                                ? Colors.black
                                : const Color.fromRGBO(255, 255, 255, 0.1),
                          ),
                        ),
                      ),
                    ),
                  );
                })
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
