import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_squirrel/model/squirrel_character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/repositories/sign.dart';
import 'package:todo_squirrel/screens/prologue/sign_in.dart';

class SettingMainPage extends StatefulWidget {
  const SettingMainPage({Key? key}) : super(key: key);

  @override
  State<SettingMainPage> createState() => _SettingMainPageState();
}

class _SettingMainPageState extends State<SettingMainPage> {
  late CharacterSettingProvider characterSettingProvider;
  bool backgroundSoundOnOff = true;
  bool pushAlarmOnOff = false;

  final Sign _sign = Sign();

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return Scaffold(
      backgroundColor: squirrelCharacter[characterSettingProvider.characterIdx]['character_color'],
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
                  onToggle: (val) {
                    setState(() {
                      pushAlarmOnOff = !pushAlarmOnOff;
                    });
                  },
                  activeToggleColor: squirrelCharacter[characterSettingProvider.characterIdx]['character_color'],
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
                    color: pushAlarmOnOff ? const Color.fromRGBO(255, 255, 255, 1) : const Color.fromRGBO(255, 255, 255, 0.4),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                InkWell(
                  onTap: () {
                    if(pushAlarmOnOff) {
                      showTimePickerPop();
                    }
                  },
                  child: Text(
                    '${characterSettingProvider.characterHour < 10 ? '0${characterSettingProvider.characterHour}' : characterSettingProvider.characterHour}:${characterSettingProvider.characterMinute < 10 ? '0${characterSettingProvider.characterMinute}' : characterSettingProvider.characterMinute}',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: pushAlarmOnOff ? const Color.fromRGBO(255, 255, 255, 1) : const Color.fromRGBO(255, 255, 255, 0.4),
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                    ),
                  )
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 53.h, left: 20.w, right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '배경음악',
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
                  value: backgroundSoundOnOff,
                  borderRadius: 17.w,
                  padding: 4.w,
                  showOnOff: false,
                  onToggle: (val) {
                    setState(() {
                      backgroundSoundOnOff = !backgroundSoundOnOff;
                    });
                  },
                  activeToggleColor: squirrelCharacter[characterSettingProvider.characterIdx]['character_color'],
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
            padding: EdgeInsets.only(top: 350.h),
            child: InkWell(
              onTap: () async {
                // _sign.leaveUser();
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
              },
              child: Text(
                '로그아웃',
                textAlign: TextAlign.center,
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
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
          height: 190.h,
          // width: 240.w,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromRGBO(255, 255, 255, 1),
          child: CupertinoDatePicker(
            onDateTimeChanged: (DateTime value) {
              characterSettingProvider.characterHour = value.hour;
              characterSettingProvider.characterMinute = value.minute;
            },
            use24hFormat: true,
            mode: CupertinoDatePickerMode.time,
          ),
        );
      },
    );


    // ;
    // return ;
    // // Future<TimeOfDay?> selectedTime = showTimePicker(
    // //   context: context,
    // //   initialTime: TimeOfDay.now(),
    // // );
    // // CupertinoTimerPicker()
    // // selectedTime.then((timeOfDay) {
    // //   // Fluttertoast.showToast(
    // //   //   msg: timeOfDay.toString(),
    // //   //   toastLength: Toast.LENGTH_LONG,
    // //   //   //gravity: ToastGravity.CENTER,  //위치(default 는 아래)
    // //   // );
    // // });
  }
}
