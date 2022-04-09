import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:speech_bubble/speech_bubble.dart';
import 'package:todo_squirrel/model/squirrel_Character.dart';

class CharacterNameGoalSettingPage extends StatefulWidget {
  const CharacterNameGoalSettingPage({Key? key, required this.characterIdx})
      : super(key: key);

  final int characterIdx;

  @override
  State<CharacterNameGoalSettingPage> createState() =>
      _CharacterNameGoalSettingPageState();
}

class _CharacterNameGoalSettingPageState
    extends State<CharacterNameGoalSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 122, 83, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 24.w,
              height: 24.w,
              color: Colors.white,
              margin: EdgeInsets.only(top: 57.h, left: 20.w),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 70.h),
                  SizedBox(
                    height: 52.h,
                    child: Stack(
                      children: [
                        Container(
                          width: 308.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.w),
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '“ 내 이름과 너의 목표를 적어줘! “',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: const Color.fromRGBO(0, 122, 83, 1),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 46.w,
                          child: ClipPath(
                            clipper: TriangleClipper(),
                            child: Container(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              height: 12.w,
                              width: 12.w,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 38.h),
                  Image.asset(
                    'assets/images/character_select_squirrel_${widget.characterIdx}.png',
                    width: 284.w,
                    height: 284.w,
                  ),
                  SizedBox(height: 60.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '내 이름은',
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(width: 14.w),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              width: 1.w,
                            ),
                          ),
                        ),
                        width: 146.w,
                        child: TextField(
                          textAlign: TextAlign.center,
                          maxLength: 8,
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 0.5),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.only(bottom: 6.h),
                            counterText: '',
                            hintText: squirrelCharacter[widget.characterIdx]
                                ['character_name'],
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(255, 255, 255, 0.5),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(width: 14.w),
                      Text(
                        '이고,',
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}
