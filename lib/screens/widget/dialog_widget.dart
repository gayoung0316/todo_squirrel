import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_squirrel/model/squirrel_Character.dart';

void showSelectDialog({
  BuildContext? context,
  int? characterIdx,
  String? mainTitle,
  String? subTitle,
  String? yestTtile,
  String? noTitle,
  Function? function,
  bool isUserLeave = false,
}) {
  showDialog(
    barrierColor: const Color.fromRGBO(7, 6, 6, 0.5),
    context: context!,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        content: Container(
          width: 296.w,
          height: 224.h,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.circular(20.w),
          ),
          child: Column(
            children: [
              isUserLeave
                  ? Padding(
                      padding: EdgeInsets.only(top: 9.h),
                      child: Image.asset(
                        'assets/icons/warring.png',
                        width: 84.w,
                        height: 69.h,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: 24.h),
                      child: Image.asset(
                        'assets/images/character_squirrel_mini_$characterIdx.png',
                        width: 60.w,
                        height: 60.w,
                      ),
                    ),
              SizedBox(height: isUserLeave ? 16.h : 10.h),
              Text(
                mainTitle!,
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: const Color.fromRGBO(97, 97, 97, 1),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 7.h),
              Text(
                subTitle!,
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: const Color.fromRGBO(158, 158, 158, 1),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => function!(),
                    child: Container(
                      width: 112.w,
                      height: 48.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(24.w),
                        border: Border.all(
                          width: 2.w,
                          color: squirrelCharacter[characterIdx!]
                              ['character_color'],
                        ),
                      ),
                      child: Text(
                        yestTtile!,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: const Color.fromRGBO(97, 97, 97, 1),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 112.w,
                      height: 48.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(24.w),
                        border: Border.all(
                          width: 2.w,
                          color: squirrelCharacter[characterIdx]
                              ['character_color'],
                        ),
                      ),
                      child: Text(
                        noTitle!,
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: const Color.fromRGBO(97, 97, 97, 1),
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
