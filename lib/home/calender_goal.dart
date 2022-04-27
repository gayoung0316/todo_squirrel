import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_squirrel/providers/calender_goal_provider.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';

class CalenderGoalPage extends StatefulWidget {
  const CalenderGoalPage({Key? key}) : super(key: key);

  @override
  State<CalenderGoalPage> createState() => _CalenderGoalPageState();
}

class _CalenderGoalPageState extends State<CalenderGoalPage> {
  late CharacterSettingProvider characterSettingProvider;
  late CalenderGoalProvider calenderGoalProvider;

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);
    calenderGoalProvider = Provider.of<CalenderGoalProvider>(context);
    var _focusedDay;
    var _year;
    var _month;

    return Scaffold(
      backgroundColor: squirrelCharacter[4]['character_color'],
      body: ListView(
        children: [
          Text(_year.toString()),
          Text(_month.toString()),
          TableCalendar(
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
            // headerVisible: false,
            headerStyle: const HeaderStyle(
              formatButtonVisible: false,
              leftChevronVisible: false,
              rightChevronVisible: false,
            ),
            onFormatChanged: (format) {
              print(format);
            },
            // 기본 포맷
            calendarFormat: CalendarFormat.month,
            // 시작 날짜
            firstDay: DateTime.utc(2000, 1, 1),
            // 마지막 날짜
            lastDay: DateTime.utc(2100, 12, 32),
            // 포커스 될 날짜
            // focusedDay: DateTime.now(),
            focusedDay: DateTime.utc(2022, 4, 12),
            rangeStartDay: DateTime.utc(2022, 4, 11),
            rangeEndDay: DateTime.utc(2022, 4, 18),
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              rangeEndDecoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1).withOpacity(0.3),
                borderRadius: BorderRadius.circular(12.w),
                shape: BoxShape.rectangle,
              ),
              cellMargin: EdgeInsets.zero,
              cellPadding: EdgeInsets.zero,
              withinRangeDecoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1).withOpacity(0.3),
                borderRadius: BorderRadius.circular(12.w),
                shape: BoxShape.rectangle,
              ),
              rangeStartDecoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1).withOpacity(0.3),
                borderRadius: BorderRadius.circular(12.w),
                shape: BoxShape.rectangle,
              ),
              rangeStartTextStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
              rangeEndTextStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
              withinRangeTextStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
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
              isTodayHighlighted: false,
            ),
            selectedDayPredicate: (day) {
              return isSameDay(_focusedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _focusedDay = selectedDay;
              });
            },
            onPageChanged: (focusedDay) {
              // setState(() {
              // });
              // _year = focusedDay.year;
              // _month = focusedDay.month;
              // setState(() {});
              // calenderGoalProvider.calenderPageYear = focusedDay.year;
              // calenderGoalProvider.calenderPageMonth = focusedDay.month;
              print(focusedDay);
            },
          ),
        ],
      ),
    );
  }
}
