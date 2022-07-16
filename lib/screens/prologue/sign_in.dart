import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
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

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context);
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 152.h, bottom: 100.h),
        children: [
          Text(
            'WELLCOME!',
            textScaleFactor: 1.0,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color.fromRGBO(64, 51, 42, 1),
              fontWeight: FontWeight.w800,
              fontSize: 46.sp,
            ),
          ),
          SizedBox(height: 30.h),
          Container(
            color: Colors.pink,
            width: 302.w,
            height: 232.h,
          ),
          SizedBox(height: 56.h),
          loginPlatformButton(
            context: context,
            loginType: 0,
            loginTypeName: '카카오톡',
          ),
          SizedBox(height: Platform.isIOS ? 26.h : 36.h),
          Visibility(
            visible: Platform.isIOS,
            child: loginPlatformButton(
              context: context,
              loginType: 2,
              loginTypeName: 'Apple',
            ),
          ),
          SizedBox(height: Platform.isIOS ? 36.h : 0),
          Column(
            children: [
              Text(
                '회원가입 없이 이용 가능하며 첫 로그인시',
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: const Color.fromRGBO(97, 97, 97, 1),
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
                      launchUrl(Uri.parse('http://13.209.77.164:4001/policy'));
                    },
                    child: Text(
                      '이용약관',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        color: const Color.fromRGBO(126, 140, 255, 1),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    ' 및 ',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: const Color.fromRGBO(97, 97, 97, 1),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      launchUrl(Uri.parse('http://13.209.77.164:4001/policy'));
                    },
                    child: Text(
                      '개인정보처리방침',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        color: const Color.fromRGBO(126, 140, 255, 1),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    ' 동의로 간주됩니다.',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: const Color.fromRGBO(97, 97, 97, 1),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              )
            ],
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
        } else if (loginType == 2) {
          var result = await _appleLogin();
          if (result != '') {
            log('애플 회원가입 완료');
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
                  ? const Color.fromRGBO(245, 245, 245, 1)
                  : const Color.fromRGBO(0, 0, 0, 1),
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
            Image.asset(
              'assets/icons/${loginType == 0 ? 'kakao' : 'google'}_login.png',
              width: 36.w,
              height: 36.w,
            ),
            Container(
              width: 204.w,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                '$loginTypeName 계정으로 로그인',
                textScaleFactor: 1.0,
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16.sp,
                  color: loginType == 2
                      ? const Color.fromRGBO(255, 255, 255, 1)
                      : const Color.fromRGBO(0, 0, 0, 1),
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
