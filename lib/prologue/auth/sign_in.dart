import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:todo_squirrel/character_setting/character_select.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  Future<bool> _googleLogIn() async {
    try {
      var result = await _googleSignIn.signIn();
      log('구글로 로그인 성공 $result');
      return true;
    } catch (error) {
      log('구글로 로그인 실패 $error');
      return false;
    }
  }

  Future<bool> _kakaoLogIn() async {
    try {
      OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
      log('카카오톡으로 로그인 성공 ${token.accessToken}');
      return true;
    } catch (error) {
      log('카카오톡으로 로그인 실패 $error');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: 388.w,
              height: 316.h,
              margin: EdgeInsets.only(top: 188.h),
              color: const Color.fromRGBO(205, 240, 174, 1),
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
        if (loginType == 0) {
          await _kakaoLogIn();
        } else {
          await _googleLogIn();
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
        decoration: BoxDecoration(
          color: loginType == 0
              ? const Color.fromRGBO(255, 232, 18, 1)
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
