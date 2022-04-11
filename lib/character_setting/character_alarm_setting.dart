import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/character_setting/character_dete_setting.dart';
import 'package:todo_squirrel/components/triangle_clipper.dart';

import 'character_setting_info.dart';

class CharacterAlarmSetting extends StatefulWidget {
  const CharacterAlarmSetting({Key? key, required this.characterIdx})
      : super(key: key);
  final int characterIdx;

  @override
  State<CharacterAlarmSetting> createState() => _CharacterAlarmSettingState();
}

class _CharacterAlarmSettingState extends State<CharacterAlarmSetting> {
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
                            '“ 알림으로 알려줄까? “',
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
                        '알림',
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              width: 1.w,
                            ),
                          ),
                        ),
                        width: 42.w,
                        child: TextField(
                          textAlign: TextAlign.center,
                          maxLength: 2,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 0.5),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.only(bottom: 6.h),
                            counterText: '',
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(255, 255, 255, 0.5),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: '00',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          ':',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              width: 1.w,
                            ),
                          ),
                        ),
                        width: 42.w,
                        child: TextField(
                          textAlign: TextAlign.center,
                          maxLength: 2,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 0.5),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            isCollapsed: true,
                            contentPadding: EdgeInsets.only(bottom: 6.h),
                            counterText: '',
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(255, 255, 255, 0.5),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: '00',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    '*시간은 24시간 형식으로 입력해줘\n알람은 나중에 언제든 변경가능하니 걱정마!',
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 0.58),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 98.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CharacterSettingInfo(
                                characterIdx: widget.characterIdx,
                              ),
                            ),
                          ),
                          child: Container(
                            width: 112.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(21.w),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '건너뛰기',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: const Color.fromRGBO(0, 122, 83, 1),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 18.w),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CharacterSettingInfo(
                                characterIdx: widget.characterIdx,
                              ),
                            ),
                          ),
                          child: Container(
                            width: 76.w,
                            height: 42.h,
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
            )
          ],
        ),
      ),
    );
  }
}
