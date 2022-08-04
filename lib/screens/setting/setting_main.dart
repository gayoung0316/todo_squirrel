import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/repositories/setting.dart';
import 'package:todo_squirrel/repositories/sign.dart';
import 'package:todo_squirrel/screens/prologue/sign_in.dart';
import 'package:todo_squirrel/screens/widget/dialog_widget.dart';

class SettingMainPage extends StatefulWidget {
  const SettingMainPage({Key? key}) : super(key: key);

  @override
  State<SettingMainPage> createState() => _SettingMainPageState();
}

class _SettingMainPageState extends State<SettingMainPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late CharacterSettingProvider characterSettingProvider;
  bool backgroundSoundOnOff = true;
  bool pushAlarmOnOff = false;

  int tempHour = 0;
  int tempMinute = 0;

  void getPushAlarmOnOff() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      pushAlarmOnOff = prefs.getBool('pushAlarmOn') ?? false;
    });
  }

  final Sign _sign = Sign();
  final Setting _setting = Setting();

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return Scaffold(
      backgroundColor: squirrelCharacter[characterSettingProvider.characterIdx]
          ['character_color'],
      body: ListView(
        padding: EdgeInsets.only(top: 57.h, bottom: 100.h),
        children: [
          SizedBox(
            height: 31.h,
            child: Text(
              '환경설정',
              textScaleFactor: 1.0,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color.fromRGBO(255, 255, 255, 1),
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 54.h, left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '푸시알림',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                FlutterSwitch(
                  width: 60.w,
                  height: 34.h,
                  toggleSize: 26.w,
                  value: pushAlarmOnOff,
                  borderRadius: 17.w,
                  padding: 4.w,
                  showOnOff: true,
                  onToggle: (val) async {
                    final SharedPreferences prefs = await _prefs;

                    setState(() {
                      pushAlarmOnOff = !pushAlarmOnOff;
                    });

                    prefs.setBool('pushAlarmOn', pushAlarmOnOff);
                  },
                  activeToggleColor:
                      squirrelCharacter[characterSettingProvider.characterIdx]
                          ['character_color'],
                  activeColor: const Color.fromRGBO(255, 255, 255, 1),
                  inactiveToggleColor: const Color.fromRGBO(255, 255, 255, 1),
                  inactiveColor: const Color.fromRGBO(211, 211, 211, 0.6),
                  activeText: '',
                  inactiveText: '',
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 54.h, left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '알림 시간',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: pushAlarmOnOff
                        ? const Color.fromRGBO(255, 255, 255, 1)
                        : const Color.fromRGBO(255, 255, 255, 0.4),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (pushAlarmOnOff) {
                      showTimePickerPop();
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        '${characterSettingProvider.characterHour < 10 ? '0${characterSettingProvider.characterHour}' : characterSettingProvider.characterHour}:${characterSettingProvider.characterMinute < 10 ? '0${characterSettingProvider.characterMinute}' : characterSettingProvider.characterMinute}',
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: pushAlarmOnOff
                              ? const Color.fromRGBO(255, 255, 255, 1)
                              : const Color.fromRGBO(255, 255, 255, 0.4),
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Image.asset(
                        'assets/icons/arrow_right.png',
                        width: 20.w,
                        height: 20.w,
                        color: pushAlarmOnOff
                            ? const Color.fromRGBO(255, 255, 255, 1)
                            : const Color.fromRGBO(255, 255, 255, 0.4),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 54.h, left: 20.w, right: 20.w),
            child: InkWell(
              onTap: () async {
                showSelectDialog(
                  context: context,
                  characterIdx: characterSettingProvider.characterIdx,
                  mainTitle: '로그아웃 하시겠습니까?',
                  subTitle: '* 데이터는 유지됩니다',
                  yestTtile: '예',
                  noTitle: '아니오',
                  function: userLogout,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '로그아웃',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/arrow_right.png',
                    width: 20.w,
                    height: 20.w,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 54.h, left: 20.w, right: 20.w),
            child: InkWell(
              onTap: () async {
                showSelectDialog(
                  context: context,
                  characterIdx: characterSettingProvider.characterIdx,
                  mainTitle: '회원을 탈퇴 하시겠습니까?',
                  subTitle: '* 모든 데이터는 즉시 삭제 됩니다',
                  yestTtile: '예',
                  noTitle: '아니오',
                  function: userLeave,
                  isUserLeave: true,
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '회원탈퇴',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/arrow_right.png',
                    width: 20.w,
                    height: 20.w,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 44.h),
            child: Column(
              children: [
                Text(
                  '버전 정보',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 0.4),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 7.h),
                Text(
                  'Powered by Junfman',
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 0.4),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showTimePickerPop() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 331.h,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 1),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35.w),
              topRight: Radius.circular(35.w),
            ),
          ),
          child: Column(
            children: [
              Material(
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 30.h,
                    right: 30.w,
                    left: 30.w,
                    bottom: 12.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          '취소',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: const Color.fromRGBO(157, 157, 157, 1),
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          var result = await _setting.editPushAlarm(
                            todoIdx: characterSettingProvider.todoListIdx,
                            time:
                                '${characterSettingProvider.characterHour < 10 ? '0${characterSettingProvider.characterHour}' : characterSettingProvider.characterHour}:${characterSettingProvider.characterMinute < 10 ? '0${characterSettingProvider.characterMinute}' : characterSettingProvider.characterMinute}:00',
                          );

                          if (result!.data['success']) {
                            Navigator.pop(context);
                            characterSettingProvider.characterHour = tempHour;
                            characterSettingProvider.characterMinute =
                                tempMinute;
                          }
                        },
                        child: Text(
                          '완료',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: squirrelCharacter[characterSettingProvider
                                .characterIdx]['character_color'],
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1.w,
              ),
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                    characterSettingProvider.characterHour,
                    characterSettingProvider.characterMinute,
                  ),
                  onDateTimeChanged: (DateTime value) {
                    tempHour = value.hour;
                    tempMinute = value.minute;
                  },
                  use24hFormat: true,
                  mode: CupertinoDatePickerMode.time,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void userLeave() async {
    await _sign.leaveUser();
    await UserApi.instance.logout();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('login-token');
    await prefs.remove('setCharacterToDo');

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const SignInPage(),
      ),
      (route) => false,
    );
  }

  void userLogout() async {
    await UserApi.instance.logout();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('login-token');
    await prefs.remove('setCharacterToDo');

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const SignInPage(),
      ),
      (route) => false,
    );
  }
}
