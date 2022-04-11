import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/character_setting/character_dete_setting.dart';
import 'package:todo_squirrel/components/triangle_clipper.dart';
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
            Padding(
              padding: EdgeInsets.only(top: 57.h, left: 20.w),
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: Image.asset(
                  'assets/icons/arrow_left.png',
                  width: 24.w,
                  height: 24.w,
                ),
              ),
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
                  ),
                  SizedBox(height: 40.h),
                  SizedBox(
                    width: 292.w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '내 목표는',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Container(
                          width: 202.w,
                          margin: EdgeInsets.only(left: 8.w),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                width: 1.w,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.h),
                  SizedBox(
                    width: 292.w,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 232.w,
                          margin: EdgeInsets.only(right: 14.w),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                width: 1.w,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '이야.',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CharacterDateSetting(
                          characterIdx: widget.characterIdx,
                        ),
                      ),
                    ),
                    child: Container(
                      width: 76.w,
                      height: 42.h,
                      margin: EdgeInsets.only(top: 60.h),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 0.5),
                        borderRadius: BorderRadius.circular(21.w),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '다음',
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: const Color.fromRGBO(0, 122, 83, 0.5),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
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
