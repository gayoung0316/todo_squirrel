import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/providers/home_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalenderGoalCheckMemoPanel extends StatelessWidget {
  const CalenderGoalCheckMemoPanel({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context); 
    CharacterSettingProvider characterSettingProvider = Provider.of<CharacterSettingProvider>(context);
    final TextEditingController _memoController = TextEditingController();
    
    return SlidingUpPanel(
      backdropEnabled: true,
      controller: homeProvider.calenderGoalCheckController,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(35.w),
        topRight: Radius.circular(35.w),
      ),
      onPanelClosed: () {
        homeProvider.calenderGoalSuccess = 0;
        _memoController.clear();
        FocusScope.of(context).unfocus();
      },
      minHeight: 0.h,
      maxHeight: 260.h,
      backdropOpacity: 0,
      panel: Padding(
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
                        ? squirrelCharacter[characterSettingProvider.characterIdx]['character_color']
                        : const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(35.w),
                        border: Border.all(
                          color: squirrelCharacter[characterSettingProvider.characterIdx]['character_color'],
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '수행',
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
                        ? squirrelCharacter[characterSettingProvider.characterIdx]['character_color']
                        : const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(35.w),
                        border: Border.all(
                          color: squirrelCharacter[characterSettingProvider.characterIdx]['character_color'],
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
                    : squirrelCharacter[characterSettingProvider.characterIdx]['character_color'],
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
    );
  }
}