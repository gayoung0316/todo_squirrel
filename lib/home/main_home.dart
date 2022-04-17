import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/model/squirrel_Character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  late CharacterSettingProvider characterSettingProvider;

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return Scaffold(
      backgroundColor: squirrelCharacter[characterSettingProvider.characterIdx]
          ['character_color'],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 91.h),
                child: Image.asset(
                  'assets/icons/goal-icon.png',
                  width: 40.w,
                  height: 40.w,
                ),
              ),
              Container(
                width: 348.w,
                margin: EdgeInsets.only(top: 50.h),
                alignment: Alignment.center,
                child: Text(
                  '물 많이 마시기',
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.w800,
                    fontSize: 32.sp,
                  ),
                ),
              ),
              Container(
                width: 348.w,
                margin: EdgeInsets.only(top: 50.h),
                alignment: Alignment.center,
                child: Text(
                  '3일째 도전중',
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 91.h),
                child: Image.asset(
                  'assets/images/character_select_squirrel_${characterSettingProvider.characterIdx}.png',
                  width: 260.w,
                  height: 260.w,
                ),
              ),
              Container(
                width: 348.w,
                margin: EdgeInsets.only(top: 50.h),
                alignment: Alignment.center,
                child: Text(
                  characterSettingProvider.characterName,
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontWeight: FontWeight.w800,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
