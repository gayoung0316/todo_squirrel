import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_squirrel/components/triangle_clipper.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';

import 'character_setting_info.dart';

class CharacterAlarmSetting extends StatefulWidget {
  const CharacterAlarmSetting({Key? key}) : super(key: key);

  @override
  State<CharacterAlarmSetting> createState() => _CharacterAlarmSettingState();
}

class _CharacterAlarmSettingState extends State<CharacterAlarmSetting> {
  late ScrollController _scrollController;
  late CharacterSettingProvider characterSettingProvider;

  final TextEditingController _hourController = TextEditingController();
  final TextEditingController _minuteController = TextEditingController();

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor:
            squirrelCharacter[characterSettingProvider.characterIdx]
                ['character_color'],
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 57.h, left: 20.w),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    _hourController.clear();
                    _minuteController.clear();
                    FocusScope.of(context).unfocus();
                  },
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
                                color: squirrelCharacter[
                                        characterSettingProvider.characterIdx]
                                    ['character_color'],
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
                      'assets/images/character_select_squirrel_${characterSettingProvider.characterIdx}.png',
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
                            controller: _hourController,
                            textAlign: TextAlign.center,
                            maxLength: 2,
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            style: TextStyle(
                              color: const Color.fromRGBO(255, 255, 255, 0.5),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            onTap: () {
                              _scrollController.animateTo(
                                120.h,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            onChanged: (value) {
                              setState(() {});
                            },
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
                            controller: _minuteController,
                            textAlign: TextAlign.center,
                            maxLength: 2,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              color: const Color.fromRGBO(255, 255, 255, 0.5),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            onTap: () {
                              _scrollController.animateTo(
                                120.h,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            onChanged: (value) {
                              setState(() {});
                            },
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
                            onTap: () {
                              if (_hourController.text.isEmpty &&
                                  _minuteController.text.isEmpty) {
                                characterSettingProvider.characterHour == 00;
                                characterSettingProvider.characterMinute == 00;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CharacterSettingInfo(),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              width: 112.w,
                              height: 42.h,
                              decoration: BoxDecoration(
                                color: _hourController.text.isEmpty &&
                                        _minuteController.text.isEmpty
                                    ? const Color.fromRGBO(255, 255, 255, 1)
                                    : const Color.fromRGBO(255, 255, 255, 0.5),
                                borderRadius: BorderRadius.circular(21.w),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '건너뛰기',
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  color: squirrelCharacter[
                                          characterSettingProvider.characterIdx]
                                      ['character_color'],
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 18.w),
                          InkWell(
                            onTap: () {
                              if (_hourController.text.isNotEmpty ||
                                  _minuteController.text.isNotEmpty) {
                                characterSettingProvider.characterHour =
                                    _hourController.text.isNotEmpty
                                        ? int.parse(_hourController.text)
                                        : 00;
                                characterSettingProvider.characterMinute =
                                    _minuteController.text.isNotEmpty
                                        ? int.parse(_minuteController.text)
                                        : 00;

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CharacterSettingInfo(),
                                  ),
                                );
                              }
                            },
                            child: Container(
                              width: 76.w,
                              height: 42.h,
                              decoration: BoxDecoration(
                                color: _hourController.text.isNotEmpty ||
                                        _minuteController.text.isNotEmpty
                                    ? const Color.fromRGBO(255, 255, 255, 1)
                                    : const Color.fromRGBO(255, 255, 255, 0.5),
                                borderRadius: BorderRadius.circular(21.w),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '다음',
                                textScaleFactor: 1.0,
                                style: TextStyle(
                                  color: squirrelCharacter[
                                          characterSettingProvider.characterIdx]
                                      ['character_color'],
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
      ),
    );
  }
}
