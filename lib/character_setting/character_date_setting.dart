import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_squirrel/character_setting/character_alarm_setting.dart';
import 'package:todo_squirrel/components/triangle_clipper.dart';
import 'package:todo_squirrel/model/squirrel_Character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';

class CharacterDateSetting extends StatefulWidget {
  const CharacterDateSetting({Key? key}) : super(key: key);

  @override
  State<CharacterDateSetting> createState() => _CharacterDateSettingState();
}

class _CharacterDateSettingState extends State<CharacterDateSetting> {
  late ScrollController _scrollController;
  late CharacterSettingProvider characterSettingProvider;
  final TextEditingController _dateController = TextEditingController();

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
                    _dateController.clear();
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
                              '“ 언제까지 할거야? “',
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
                          '오늘부터',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                width: 1.w,
                              ),
                            ),
                          ),
                          width: 60.w,
                          child: TextField(
                            controller: _dateController,
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
                                100.h,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
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
                              hintText: '7',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          '일 동안!',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      '*최소 7일에서 최대 31일까지 설정 할 수 있어',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        color: const Color.fromRGBO(255, 255, 255, 0.58),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 125.h),
                    InkWell(
                      onTap: () {
                        if (_dateController.text.isEmpty) {
                          characterSettingProvider.characterDate = 7;
                        } else {
                          characterSettingProvider.characterDate =
                              int.parse(_dateController.text);
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CharacterAlarmSetting(),
                          ),
                        );
                      },
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
                            color: squirrelCharacter[characterSettingProvider
                                .characterIdx]['character_color'],
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
      ),
    );
  }
}
