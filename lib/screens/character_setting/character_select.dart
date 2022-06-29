import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';

import 'character_name_goal_setting.dart';

class CharacterSelectPage extends StatefulWidget {
  const CharacterSelectPage({Key? key}) : super(key: key);

  @override
  State<CharacterSelectPage> createState() => _CharacterSelectPageState();
}

class _CharacterSelectPageState extends State<CharacterSelectPage> {
  final PageController _pageController = PageController(viewportFraction: 0.87);
  int _characterIdx = 0;
  late CharacterSettingProvider characterSettingProvider;

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 31.h,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 54.h, bottom: 27.h),
              child: Text(
                '캐릭터 선택',
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.w),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: const Offset(0, 5),
                    blurRadius: 15.w,
                    spreadRadius: 0,
                  ),
                ],
              ),
              height: 633.h,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    _characterIdx = value;
                  });
                },
                children: <Widget>[
                  ...squirrelCharacter.map((item) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.w),
                        color: item['character_color'],
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 80.h),
                          Text(
                            item['character_title'],
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.w800,
                              fontSize: 24.sp,
                            ),
                          ),
                          SizedBox(height: 50.h),
                          Image.asset(
                            'assets/images/character_select_squirrel_${squirrelCharacter.indexOf(item)}.png',
                            width: 210.w,
                            height: 210.w,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20.h, bottom: 40.h),
                            padding: EdgeInsets.symmetric(
                              vertical: 3.h,
                              horizontal: 21.w,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(16.w),
                            ),
                            child: Text(
                              item['character_name'],
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w800,
                                color: item['character_color'],
                              ),
                            ),
                          ),
                          characterInfo(
                            title: '성격',
                            content: item['character_personality'],
                          ),
                          characterInfo(
                            title: 'MBTI',
                            content: item['character_mbti'],
                          ),
                          characterInfo(
                            title: '취미',
                            content: item['character_hobby'],
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: 45.h),
            InkWell(
              onTap: () {
                characterSettingProvider.characterIdx = _characterIdx;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CharacterNameGoalSettingPage(),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      spreadRadius: 0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(21.w),
                ),
                child: Text(
                  '시작하기',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget characterInfo({required String title, required String content}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h, left: 50.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 40.w,
            margin: EdgeInsets.only(right: 20.w),
            child: Text(
              title,
              textScaleFactor: 1.0,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
                color: const Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
          Text(
            content,
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
          ),
        ],
      ),
    );
  }
}
