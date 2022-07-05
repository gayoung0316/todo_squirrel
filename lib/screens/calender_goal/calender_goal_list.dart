import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/calender_goal_check_provider.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/providers/goal_list_provider.dart';
import 'package:todo_squirrel/providers/home_provider.dart';

class CalenderGoalListPanel extends StatelessWidget {
  const CalenderGoalListPanel({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = Provider.of<HomeProvider>(context); 
    CharacterSettingProvider characterSettingProvider = Provider.of<CharacterSettingProvider>(context);
    GoalListProvider goalListProvider = Provider.of<GoalListProvider>(context);
    CalenderGoalCheckProvider calenderGoalCheckProvider = Provider.of<CalenderGoalCheckProvider>(context);
    
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (calenderGoalCheckProvider.goalListIsPanelOpen) {
              homeProvider.goalListController.close();
            } else if (!calenderGoalCheckProvider.goalListIsPanelOpen) {
              homeProvider.goalListController.open();
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 60.h,
            decoration: BoxDecoration(
              color: !calenderGoalCheckProvider.goalListIsPanelOpen
              ? const Color(0xfff5f5f5)
              : const Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.w),
                topRight: Radius.circular(35.w),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !calenderGoalCheckProvider.goalListIsPanelOpen
                ? Text(
                  '너의 목표를 확인해봐!',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(158, 158, 158, 1),
                  ),
                )
                : Text(
                  '도전 ${(characterSettingProvider.characterEndDate.difference(DateTime.now()).inDays - characterSettingProvider.characterRangeDate).toString().replaceAll('-', '')}일차',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(158, 158, 158, 1),
                  ),
                )
              ],
            ),
          ),
        ),
        ...goalListProvider.calenderGoalList.map(
          (item) => goalListBoxWidget(
            context, 
            characterSettingProvider,
            itemIdx: goalListProvider.calenderGoalList.indexOf(item) + 1,
            goalTitle: item['title'],
            goalPeriod: item['duration'],
            goalPerfection: item['perfection']
          )
        ),
      ],
    );
  }

  Widget goalListBoxWidget(
    BuildContext context, 
    CharacterSettingProvider characterSettingProvider,
    {
      required int itemIdx,
      required String goalTitle,
      required int goalPeriod,
      required num goalPerfection,
    }
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.h,
      color: itemIdx % 2 == 0 ? const Color.fromRGBO(255, 255, 255, 1) : const Color(0xfff5f5f5),
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
              itemIdx.toString(),
              textScaleFactor: 1.0,
              style: TextStyle(
                color: squirrelCharacter[characterSettingProvider.characterIdx]['character_color'],
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
                  goalTitle,
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
                      '${goalPeriod - 1} Days',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: squirrelCharacter[characterSettingProvider.characterIdx]['character_color'],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 27.w),
          Text(
            '$goalPerfection%',
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w400,
              color: squirrelCharacter[characterSettingProvider.characterIdx]['character_color'],
            ),
          ),
        ],
      ),
    );
  }
}