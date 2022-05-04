import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/providers/home_provider.dart';

class CalenderGoalCheck extends StatefulWidget {
  const CalenderGoalCheck({Key? key}) : super(key: key);

  @override
  State<CalenderGoalCheck> createState() => _CalenderGoalCheckState();
}

class _CalenderGoalCheckState extends State<CalenderGoalCheck> {
  late HomeProvider homeProvider;
  late CharacterSettingProvider characterSettingProvider;
  final TextEditingController _memoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context);
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return Scaffold(
      body: homeProvider.calenderGoalCheckMemo
          ? Padding(
              padding: EdgeInsets.only(left: 40.w, top: 23.h),
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
                            // '수행',
                            MediaQuery.of(context).viewInsets.bottom.toString(),
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: homeProvider.calenderGoalSuccess == 1
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
                        onTap: () => homeProvider.calenderGoalSuccess = 2,
                        child: Container(
                          width: 80.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: homeProvider.calenderGoalSuccess == 2
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
                              color: homeProvider.calenderGoalSuccess == 2
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
                      onChanged: (value) {
                        setState(() {
                          print(MediaQuery.of(context).viewInsets.bottom);
                          print(context);
                        });
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
                ],
              ),
            )
          : Column(
              children: [
                InkWell(
                  onTap: () {
                    if (homeProvider.calenderGoalCheckController.isPanelOpen) {
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
                      color:
                          homeProvider.calenderGoalCheckControllerPosition == 1
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
                        homeProvider.calenderGoalCheckControllerPosition == 1
                            ? Text(
                                '도전 ${(characterSettingProvider.characterEndDate.difference(DateTime.now()).inDays - characterSettingProvider.characterRangeDate).toString().replaceAll('-', '')}일차',
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(158, 158, 158, 1),
                                ),
                              )
                            : Text(
                                '너의 목표를 확인해봐!',
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(158, 158, 158, 1),
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
                              color: squirrelCharacter[characterSettingProvider
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
                                  color: const Color.fromRGBO(97, 97, 97, 1),
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
                                              .characterIdx]['character_color'],
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
                            color: squirrelCharacter[characterSettingProvider
                                .characterIdx]['character_color'],
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
                            color: squirrelCharacter[characterSettingProvider
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
                              '물 많이 마시기',
                              textScaleFactor: 1.0,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color.fromRGBO(97, 97, 97, 1),
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
                                    color:
                                        const Color.fromRGBO(158, 158, 158, 1),
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
                                            .characterIdx]['character_color'],
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
                          color: squirrelCharacter[characterSettingProvider
                              .characterIdx]['character_color'],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  // height: MediaQuery.of(context).viewInsets.bottom,
                ),
              ],
            ),
    );
  }
}
