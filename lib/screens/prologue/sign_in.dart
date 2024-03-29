import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/providers/home_provider.dart';
import 'package:todo_squirrel/repositories/sign.dart';
import 'package:todo_squirrel/screens/character_setting/character_select.dart';
import 'package:todo_squirrel/screens/home/home_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final Sign _sign = Sign();
  late CharacterSettingProvider characterSettingProvider;
  late HomeProvider homeProvider;

  Future<String> _kakaoLogIn() async {
    try {
      final isKakaoInstalled = await isKakaoTalkInstalled();

      if (isKakaoInstalled) {
        log('카카오 설치 됨');
        await UserApi.instance.loginWithKakaoTalk();
      } else {
        log('카카오 설치 안됨');
        await UserApi.instance.loginWithKakaoAccount();
      }

      AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();

      var kakaoToken = await _sign.signIn(
        platform: 0,
        token: tokenInfo.id.toString(),
      );

      return kakaoToken!.data['token'];
    } catch (error) {
      log('카카오톡으로 로그인 실패 $error');
      return '';
    }
  }

  Future<String?> _appleLogin() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      var appleToken = await _sign.signIn(
        platform: 1,
        token: credential.userIdentifier!.replaceAll('.', ''),
      );

      return appleToken!.data['token'];
    } catch (e) {
      log('애플 로그인 실패 : $e');
      return '';
    }
  }

  Future<String?> _guestLogin() async {
    try {
      String appName = 'ToDoSquirrel';
      String platform = Platform.isAndroid ? 'Android' : 'iOS';
      String deviceId = await PlatformDeviceId.getDeviceId ?? '';

      var guestToken = await _sign.signIn(
        platform: 2,
        token: '$appName-$platform-$deviceId',
      );

      return guestToken!.data['token'];
    } catch (e) {
      log('게스트 로그인 실패 : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context);
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/login-background.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 50.h,
            child: Column(
              children: [
                loginPlatformButton(
                  context: context,
                  loginType: 0,
                  loginTypeName: '카카오톡',
                ),
                SizedBox(height: Platform.isIOS ? 20.h : 36.h),
                Visibility(
                  visible: Platform.isIOS,
                  child: loginPlatformButton(
                    context: context,
                    loginType: 1,
                    loginTypeName: 'Apple',
                  ),
                ),
                SizedBox(height: Platform.isIOS ? 20.h : 36.h),
                loginPlatformButton(
                  context: context,
                  loginType: 2,
                  loginTypeName: '게스트',
                ),
                SizedBox(height: 100.h),
                Text(
                  '회원가입 없이 이용 가능하며 첫 로그인시',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        launchUrl(
                            Uri.parse('http://13.209.77.164:4001/policy'));
                      },
                      child: Text(
                        '이용약관',
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      ' 및 ',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    InkWell(
                      onTap: () => launchUrl(
                        Uri.parse('http://13.209.77.164:4001/policy'),
                      ),
                      child: Text(
                        '개인정보처리방침',
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      ' 동의로 간주됩니다.',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget loginPlatformButton({
    required BuildContext context,
    required int loginType,
    required String loginTypeName,
  }) {
    return InkWell(
      onTap: () async {
        final SharedPreferences prefs = await _prefs;

        if (loginType == 0) {
          var result = await _kakaoLogIn();
          log('api 연결 성공 : $result');
          if (result != '') {
            log('카카오톡 회원가입 완료');
            prefs.setString('login-token', result);
          }
        } else if (loginType == 1) {
          var result = await _appleLogin();
          if (result != '') {
            log('애플 회원가입 완료');
            prefs.setString('login-token', result!);
          }
        } else if (loginType == 2) {
          var result = await _guestLogin();
          if (result != '') {
            log('게스트 회원가입 완료');
            prefs.setString('login-token', result!);
          }
        }

        await characterSettingProvider.setCharacterSettingInfo(state: 0);

        if (characterSettingProvider.successGetCharacterSettingInfo) {
          homeProvider.setPageIdx(2);
          prefs.setBool('setCharacterToDo', true);

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreenPage(),
            ),
            (route) => false,
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const CharacterSelectPage(),
            ),
            (route) => false,
          );
        }
      },
      child: Container(
        width: 316.w,
        height: 60.h,
        margin: EdgeInsets.symmetric(horizontal: 56.w),
        decoration: BoxDecoration(
          color: loginType == 0
              ? const Color.fromRGBO(255, 232, 18, 1)
              : loginType == 1
                  ? const Color.fromRGBO(0, 0, 0, 1)
                  : const Color.fromRGBO(245, 245, 245, 1),
          borderRadius: BorderRadius.circular(30.w),
          boxShadow: const [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 4),
              blurRadius: 12,
              spreadRadius: 0,
            )
          ],
        ),
        padding: EdgeInsets.only(left: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: loginType != 2,
              child: Image.asset(
                'assets/icons/${loginType == 0 ? 'kakao' : 'apple'}_login.png',
                width: 36.w,
                height: 36.w,
              ),
            ),
            Container(
              width: 204.w,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                '$loginTypeName로 로그인',
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16.sp,
                  color: loginType == 2 || loginType == 0
                      ? const Color.fromRGBO(0, 0, 0, 1)
                      : const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ),
            SizedBox(
              width: 36.w,
              height: 36.w,
            )
          ],
        ),
      ),
    );
  }
}
