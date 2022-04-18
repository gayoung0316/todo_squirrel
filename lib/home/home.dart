import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_squirrel/home/calender_goal.dart';
import 'package:todo_squirrel/home/failure_goal.dart';
import 'package:todo_squirrel/home/main_home.dart';
import 'package:todo_squirrel/home/setting_main.dart';
import 'package:todo_squirrel/home/success_goal.dart';
import 'package:todo_squirrel/model/squirrel_Character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/providers/home_provider.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({Key? key}) : super(key: key);

  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  late CharacterSettingProvider characterSettingProvider;
  late HomeProvider homeProvider;

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);
    homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          IndexedStack(
            index: homeProvider.pageIdx,
            children: const [
              CalenderGoalPage(),
              FailureGoalPage(),
              MainHomePage(),
              SuccessGoalPage(),
              SettingMainPage(),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 94.h,
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x29000000),
                  offset: Offset(0, -5),
                  blurRadius: 15,
                  spreadRadius: 0,
                )
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35.w),
                topRight: Radius.circular(35.w),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildBottomNavigationBarItem(
                  icon: 'assets/icons/calender.png',
                  index: 0,
                  isActive: homeProvider.pageIdx == 0 ? true : false,
                ),
                _buildBottomNavigationBarItem(
                  icon: 'assets/icons/failure-goal.png',
                  index: 1,
                  isActive: homeProvider.pageIdx == 1 ? true : false,
                ),
                _buildBottomNavigationBarItem(
                  icon:
                      'assets/icons/home-${characterSettingProvider.characterIdx}.png',
                  index: 2,
                  isActive: homeProvider.pageIdx == 2 ? true : false,
                ),
                _buildBottomNavigationBarItem(
                  icon: 'assets/icons/success-goal.png',
                  index: 3,
                  isActive: homeProvider.pageIdx == 3 ? true : false,
                ),
                _buildBottomNavigationBarItem(
                  icon: 'assets/icons/setting.png',
                  index: 4,
                  isActive: homeProvider.pageIdx == 4 ? true : false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBarItem({
    String? icon,
    bool isActive = false,
    int? index,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          homeProvider.pageIdx = index!;
        });
      },
      child: Image.asset(
        icon!,
        width: index == 2 ? 44.w : 30.w,
        height: index == 2 ? 44.w : 30.w,
        color: index != 2
            ? squirrelCharacter[characterSettingProvider.characterIdx]
                ['character_color']
            : null,
      ),
    );
  }
}
