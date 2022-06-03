import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:todo_squirrel/character_setting/character_select.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<String> _googleLogIn() async {
    try {
      var result = await _googleSignIn.signIn();
      log('구글로 로그인 성공 $result');
      return result!.id;
    } catch (error) {
      log('구글로 로그인 실패 $error');
      return '';
    }
  }

  Future<String> _kakaoLogIn() async {
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      log('카카오톡으로 로그인 성공 ${token.accessToken}');
      return token.accessToken;
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
      log('애플 로그인 성공 : $credential');
      return credential.identityToken;
    } catch (e) {
      log('애플 로그인 실패 : $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(height: 152.h),
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
          SizedBox(height: 26.h),
          loginPlatformButton(
            context: context,
            loginType: 1,
            loginTypeName: '구글',
          ),
          SizedBox(height: 26.h),
          loginPlatformButton(
            context: context,
            loginType: 2,
            loginTypeName: 'Apple',
          ),
          SizedBox(height: 36.h),
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
                  Text(
                    '이용약관',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: const Color.fromRGBO(126, 140, 255, 1),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
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
                  Text(
                    '개인정보처리방침',
                    textScaleFactor: 1.0,
                    style: TextStyle(
                      color: const Color.fromRGBO(126, 140, 255, 1),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
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
          await _kakaoLogIn();
          prefs.setString('login-token', '');
        } else if(loginType == 1) {
          await _googleLogIn();
          prefs.setString('login-token', '');
        } else if(loginType == 2) {
          await _appleLogin();
          prefs.setString('login-token', '');
        }
        
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const CharacterSelectPage(),
          ),
          (route) => false,
        );
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
                        : const Color.fromRGBO(0, 0, 0, 1)),
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
