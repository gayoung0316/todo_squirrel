import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/components/triangle_clipper.dart';
import 'package:todo_squirrel/model/squirrel_Character.dart';

class CharacterSettingInfo extends StatefulWidget {
  const CharacterSettingInfo({Key? key, required this.characterIdx})
      : super(key: key);
  final int characterIdx;

  @override
  State<CharacterSettingInfo> createState() => _CharacterSettingInfoState();
}

class _CharacterSettingInfoState extends State<CharacterSettingInfo> {
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
                            '“ 안녕 난 ${squirrelCharacter[widget.characterIdx]['character_name']}야 잘 부탁해! “',
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
                  SizedBox(height: 30.h),
                  characterInfo(
                    title: '이름',
                    content: squirrelCharacter[widget.characterIdx]
                        ['character_name'],
                  ),
                  SizedBox(height: 34.h),
                  characterInfo(
                    title: '목표',
                    content: '물 많이 마시기 물 많이 마시기 물많이 마',
                  ),
                  SizedBox(height: 34.h),
                  characterInfo(
                    title: '날짜',
                    content: '2022.04.08~2022.04.14',
                  ),
                  SizedBox(height: 34.h),
                  characterInfo(
                    title: '알람',
                    content: '15:00',
                  ),
                  Container(
                    width: 112.w,
                    height: 42.h,
                    margin: EdgeInsets.only(top: 41.h),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.circular(21.w),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '시작하기',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        color: const Color.fromRGBO(0, 122, 83, 1),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w800,
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

  Widget characterInfo({required String title, required String content}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 90.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textScaleFactor: 1.0,
            style: TextStyle(
              color: const Color.fromRGBO(255, 255, 255, 1),
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(width: 30.w),
          SizedBox(
            width: 180.w,
            child: Text(
              content,
              textScaleFactor: 1.0,
              style: TextStyle(
                color: const Color.fromRGBO(255, 255, 255, 1),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
