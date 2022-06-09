import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_squirrel/calender_goal/calender_goal.dart';
import 'package:todo_squirrel/failure_goal/failure_goal.dart';
import 'package:todo_squirrel/home/character_main_home.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/setting/setting_main.dart';
import 'package:todo_squirrel/success_goal/success_goal.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/providers/home_provider.dart';
import 'package:custom_top_navigator/custom_top_navigator.dart';
import '../widget/coach_marks_page.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({Key? key}) : super(key: key);

  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  late CharacterSettingProvider characterSettingProvider;
  late HomeProvider homeProvider;
  GlobalKey<NavigatorState> failuerGoalNavigatorKey =
      GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> successGoalNavigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);
    homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      body: homeProvider.isShowCoachMarks
          ? const CoachMarksPage()
          : Stack(
              alignment: Alignment.bottomCenter,
              children: [
                IndexedStack(
                  index: homeProvider.pageIdx,
                  children: [
                    const CalenderGoalPage(),
                    CustomTopNavigator(
                      navigatorKey: failuerGoalNavigatorKey,
                      home: const FailureGoalPage(),
                      pageRoute: PageRoutes.materialPageRoute,
                    ),
                    const MainHomePage(),
                    CustomTopNavigator(
                      navigatorKey: successGoalNavigatorKey,
                      home: const SuccessGoalPage(),
                      pageRoute: PageRoutes.materialPageRoute,
                    ),
                    const SettingMainPage(),
                  ],
                ),
              ],
            ),
      bottomNavigationBar: homeProvider.isShowCoachMarks
          ? null
          : BottomNavigationBar(
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
                        'assets/icons/calender.png',
                        width: 30.w,
                        height: 30.w,
                        color: homeProvider.pageIdx == 0
                            ? Colors.white
                            : squirrelCharacter[characterSettingProvider
                                .characterIdx]['character_color'],
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
                            : squirrelCharacter[characterSettingProvider
                                .characterIdx]['character_color'],
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
                            : squirrelCharacter[characterSettingProvider
                                .characterIdx]['character_color'],
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
                            : squirrelCharacter[characterSettingProvider
                                .characterIdx]['character_color'],
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
                        'assets/icons/setting.png',
                        width: 30.w,
                        height: 30.w,
                        color: homeProvider.pageIdx == 4
                            ? Colors.white
                            : squirrelCharacter[characterSettingProvider
                                .characterIdx]['character_color'],
                      ),
                    ],
                  ),
                  label: '',
                ),
              ],
            ),
    );
  }
}
