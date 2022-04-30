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
        // 기본 포맷
        calendarFormat: CalendarFormat.month,
        // 시작 날짜
        firstDay: DateTime.utc(2000, 1, 1),
        // 마지막 날짜
        lastDay: DateTime.utc(2100, 12, 31),
        // 포커스 될 날짜
        focusedDay: DateTime.now(),
        rangeStartDay: DateTime.utc(2022, 4, 12),
        // rangeStartDay: characterSettingProvider.characterStartDate,
        rangeEndDay: DateTime.utc(2022, 4, 18),
        // rangeEndDay: characterSettingProvider.characterEndDate,
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
          isTodayHighlighted: true,
        ),
      ),
    );
  }
}
