import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_squirrel/home/calender_goal.dart';
import 'package:todo_squirrel/home/failure_goal.dart';
import 'package:todo_squirrel/home/main_home.dart';
import 'package:todo_squirrel/home/setting_main.dart';
import 'package:todo_squirrel/home/success_goal.dart';
import 'package:todo_squirrel/model/nav_item.dart';
import 'package:todo_squirrel/model/squirrel_Character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({Key? key}) : super(key: key);

  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int _selectedIndex = 0;
  late CharacterSettingProvider characterSettingProvider;

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          IndexedStack(
            index: _selectedIndex,
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  naveItens.length,
                  (index) => _buildBottomNavigationBarItem(
                    icon: naveItens[index].icon,
                    isActive:
                        naveItens[index].id == _selectedIndex ? true : false,
                    index: index,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onTaped(index) {}

  Widget _buildBottomNavigationBarItem({
    String? icon,
    bool isActive = false,
    int? index,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index!;
        });
      },
      child: Container(
        width: 44.w,
        height: 44.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: squirrelCharacter[characterSettingProvider.characterIdx]
              ['character_color'],
        ),
        child: Image.asset(
          icon!,
          width: 30.w,
          height: 30.w,
          color: isActive
              ? Colors.white
              : squirrelCharacter[characterSettingProvider.characterIdx]
                  ['character_color'],
        ),
      ),
    );
  }
}
