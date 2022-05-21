import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_squirrel/model/month.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/providers/home_provider.dart';

class CalenderGoalPage extends StatefulWidget {
  const CalenderGoalPage({Key? key}) : super(key: key);

  @override
  State<CalenderGoalPage> createState() => _CalenderGoalPageState();
}

class _CalenderGoalPageState extends State<CalenderGoalPage> {
  late CharacterSettingProvider characterSettingProvider;
  late HomeProvider homeProvider;
  final TextEditingController _memoController = TextEditingController();

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
    homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      backgroundColor: squirrelCharacter[characterSettingProvider.characterIdx]
          ['character_color'],
      body: Stack(
        children: [
          calenderWidget(),
          SlidingUpPanel(
            backdropEnabled: true,
            controller: homeProvider.calenderGoalCheckController,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.w),
              topRight: Radius.circular(35.w),
            ),
            onPanelSlide: (position) {
              homeProvider.calenderGoalCheckControllerPosition = position;
            },
            onPanelClosed: () {
              homeProvider.calenderGoalCheckMemo = false;
              homeProvider.calenderGoalSuccess = 0;
              _memoController.clear();
              FocusScope.of(context).unfocus();
            },
            minHeight: 59.h,
            maxHeight: 260.h,
            backdropOpacity: 0,
            panel: homeProvider.calenderGoalCheckMemo
                ? Padding(
                    padding: EdgeInsets.only(left: 40.w, top: 23.h),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${DateTime.now().month}월 ${DateTime.now().day}일',
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
                                  homeProvider.calenderGoalSuccess = 1;
                                },
                                child: Container(
                                  width: 80.w,
                                  height: 32.h,
                                  decoration: BoxDecoration(
                                    color: homeProvider.calenderGoalSuccess == 1
                                        ? squirrelCharacter[
                                                characterSettingProvider
                                                    .characterIdx]
                                            ['character_color']
                                        : const Color.fromRGBO(
                                            255, 255, 255, 1),
                                    borderRadius: BorderRadius.circular(35.w),
                                    border: Border.all(
                                      color: squirrelCharacter[
                                          characterSettingProvider
                                              .characterIdx]['character_color'],
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '수행',
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                      color:
                                          homeProvider.calenderGoalSuccess == 1
                                              ? const Color.fromRGBO(
                                                  255,
                                                  255,
                                                  255,
                                                  1,
                                                )
                                              : const Color.fromRGBO(
                                                  158,
                                                  158,
                                                  158,
                                                  1,
                                                ),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              InkWell(
                                onTap: () =>
                                    homeProvider.calenderGoalSuccess = 2,
                                child: Container(
                                  width: 80.w,
                                  height: 32.h,
                                  decoration: BoxDecoration(
                                    color: homeProvider.calenderGoalSuccess == 2
                                        ? squirrelCharacter[
                                                characterSettingProvider
                                                    .characterIdx]
                                            ['character_color']
                                        : const Color.fromRGBO(
                                            255, 255, 255, 1),
                                    borderRadius: BorderRadius.circular(35.w),
                                    border: Border.all(
                                      color: squirrelCharacter[
                                          characterSettingProvider
                                              .characterIdx]['character_color'],
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    '미수행',
                                    textScaleFactor: 1.0,
                                    style: TextStyle(
                                      color:
                                          homeProvider.calenderGoalSuccess == 2
                                              ? const Color.fromRGBO(
                                                  255, 255, 255, 1)
                                              : const Color.fromRGBO(
                                                  158, 158, 158, 1),
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
                                color: _memoController.text.isEmpty
                                    ? const Color.fromRGBO(112, 112, 112, 0.5)
                                    : squirrelCharacter[characterSettingProvider
                                        .characterIdx]['character_color'],
                              ),
                            ),
                            child: TextField(
                              controller: _memoController,
                              // keyboardType: TextInputType.multiline,
                              maxLines: 2,
                              minLines: 1,
                              // textAlign: TextAlign.left,
                              style: TextStyle(
                                color: const Color.fromRGBO(33, 33, 33, 1),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
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
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if (homeProvider
                              .calenderGoalCheckController.isPanelOpen) {
                            homeProvider.calenderGoalCheckController.close();
                          } else if (homeProvider
                              .calenderGoalCheckController.isPanelClosed) {
                            homeProvider.calenderGoalCheckController.open();
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: homeProvider
                                        .calenderGoalCheckControllerPosition ==
                                    1
                                ? const Color.fromRGBO(255, 255, 255, 1)
                                : const Color(0xfff5f5f5),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35.w),
                              topRight: Radius.circular(35.w),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              homeProvider.calenderGoalCheckControllerPosition ==
                                      1
                                  ? Text(
                                      '도전 ${(characterSettingProvider.characterEndDate.difference(DateTime.now()).inDays - characterSettingProvider.characterRangeDate).toString().replaceAll('-', '')}일차',
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            158, 158, 158, 1),
                                      ),
                                    )
                                  : Text(
                                      '너의 목표를 확인해봐!',
                                      textScaleFactor: 1.0,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color.fromRGBO(
                                            158, 158, 158, 1),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          homeProvider.calenderGoalCheckMemo = true;
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 100.h,
                          color: const Color(0xfff5f5f5),
                          // color: const Color.fromRGBO(255, 255, 255, 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 30.w,
                                height: 30.w,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  borderRadius: BorderRadius.circular(12.w),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  '2',
                                  textScaleFactor: 1.0,
                                  style: TextStyle(
                                    color: squirrelCharacter[
                                        characterSettingProvider
                                            .characterIdx]['character_color'],
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(width: 21.w),
                              SizedBox(
                                width: 168.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '퇴근시켜주세요일하기시러여',
                                      textScaleFactor: 1.0,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            const Color.fromRGBO(97, 97, 97, 1),
                                      ),
                                    ),
                                    SizedBox(height: 12.h),
                                    Row(
                                      children: [
                                        Text(
                                          '기간',
                                          textScaleFactor: 1.0,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: const Color.fromRGBO(
                                                158, 158, 158, 1),
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Text(
                                          '7 Days',
                                          textScaleFactor: 1.0,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: squirrelCharacter[
                                                    characterSettingProvider
                                                        .characterIdx]
                                                ['character_color'],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 27.w),
                              Text(
                                '10%',
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w400,
                                  color: squirrelCharacter[
                                          characterSettingProvider.characterIdx]
                                      ['character_color'],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100.h,
                        // color: const Color(0xfff5f5f5),
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 30.w,
                              height: 30.w,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                borderRadius: BorderRadius.circular(12.w),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '1',
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  color: squirrelCharacter[
                                          characterSettingProvider.characterIdx]
                                      ['character_color'],
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(width: 21.w),
                            SizedBox(
                              width: 168.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '물 많이 마시기',
                                    textScaleFactor: 1.0,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      color:
                                          const Color.fromRGBO(97, 97, 97, 1),
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  Row(
                                    children: [
                                      Text(
                                        '기간',
                                        textScaleFactor: 1.0,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromRGBO(
                                              158, 158, 158, 1),
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        '7 Days',
                                        textScaleFactor: 1.0,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: squirrelCharacter[
                                                  characterSettingProvider
                                                      .characterIdx]
                                              ['character_color'],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 27.w),
                            Text(
                              '90%',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontSize: 32.sp,
                                fontWeight: FontWeight.w400,
                                color: squirrelCharacter[
                                        characterSettingProvider.characterIdx]
                                    ['character_color'],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget calenderWidget() {
    return Container(
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
                                ? squirrelCharacter[characterSettingProvider
                                    .characterIdx]['character_color']
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
