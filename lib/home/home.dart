import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_squirrel/home/calender_goal.dart';
import 'package:todo_squirrel/home/failure_goal.dart';
import 'package:todo_squirrel/home/main_home.dart';
import 'package:todo_squirrel/home/setting_main.dart';
import 'package:todo_squirrel/home/success_goal.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/providers/home_provider.dart';

import 'character_goal_check.dart';

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
      // extendBody: true,
      // extendBody: true,
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
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: homeProvider.pageIdx,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        selectedItemColor:
            squirrelCharacter[characterSettingProvider.characterIdx]
                ['character_color'],
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          setState(() {
            homeProvider.pageIdx = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Visibility(
                  child: Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: BoxDecoration(
                      color: homeProvider.pageIdx == 0
                          ? squirrelCharacter[characterSettingProvider
                              .characterIdx]['character_color']
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Image.asset(
                  // icon!,
                  'assets/icons/calender.png',
                  width: 30.w,
                  height: 30.w,
                  color: homeProvider.pageIdx == 0
                      ? Colors.white
                      : squirrelCharacter[characterSettingProvider.characterIdx]
                          ['character_color'],
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Visibility(
                  child: Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: BoxDecoration(
                      color: homeProvider.pageIdx == 1
                          ? squirrelCharacter[characterSettingProvider
                              .characterIdx]['character_color']
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Image.asset(
                  // icon!,
                  'assets/icons/failure-goal.png',
                  width: 30.w,
                  height: 30.w,
                  color: homeProvider.pageIdx == 1
                      ? Colors.white
                      : squirrelCharacter[characterSettingProvider.characterIdx]
                          ['character_color'],
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Visibility(
                  child: Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: BoxDecoration(
                      color: homeProvider.pageIdx == 2
                          ? squirrelCharacter[characterSettingProvider
                              .characterIdx]['character_color']
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Image.asset(
                  // icon!,
                  'assets/icons/main-home.png',
                  width: 30.w,
                  height: 30.w,
                  color: homeProvider.pageIdx == 2
                      ? Colors.white
                      : squirrelCharacter[characterSettingProvider.characterIdx]
                          ['character_color'],
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Visibility(
                  child: Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: BoxDecoration(
                      color: homeProvider.pageIdx == 3
                          ? squirrelCharacter[characterSettingProvider
                              .characterIdx]['character_color']
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Image.asset(
                  // icon!,
                  'assets/icons/success-goal.png',
                  width: 30.w,
                  height: 30.w,
                  color: homeProvider.pageIdx == 3
                      ? Colors.white
                      : squirrelCharacter[characterSettingProvider.characterIdx]
                          ['character_color'],
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              alignment: Alignment.center,
              children: [
                Visibility(
                  child: Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: BoxDecoration(
                      color: homeProvider.pageIdx == 4
                          ? squirrelCharacter[characterSettingProvider
                              .characterIdx]['character_color']
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Image.asset(
                  // icon!,
                  'assets/icons/setting.png',
                  width: 30.w,
                  height: 30.w,
                  color: homeProvider.pageIdx == 4
                      ? Colors.white
                      : squirrelCharacter[characterSettingProvider.characterIdx]
                          ['character_color'],
                ),
              ],
            ),
            label: '',
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
      child: Stack(
        alignment: Alignment.center,
        children: [
          Visibility(
            child: Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: homeProvider.pageIdx == index
                    ? squirrelCharacter[characterSettingProvider.characterIdx]
                        ['character_color']
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Image.asset(
            icon!,
            width: 30.w,
            height: 30.w,
            color: homeProvider.pageIdx == index
                ? Colors.white
                : squirrelCharacter[characterSettingProvider.characterIdx]
                    ['character_color'],
          ),
        ],
      ),
    );
  }
}
