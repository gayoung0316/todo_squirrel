import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_squirrel/home/home_screen.dart';
import 'package:todo_squirrel/prologue/onboarding.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/providers/home_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late HomeProvider homeProvider;
  late CharacterSettingProvider characterSettingProvider;

  void getUserLoginToken() async {
    final SharedPreferences prefs = await _prefs;
    var userLoginToken = prefs.getString('login-token');

    log('사용자의 로그인 토큰 : $userLoginToken');

    if(userLoginToken != null) {
      WidgetsBinding.instance!.addPostFrameCallback((_) async {
        context.read<HomeProvider>().setPageIdx(2);
        context.read<CharacterSettingProvider>().setCharacterSettingInfo(state: 0);
      });
    }
  }

  @override
  void initState() {
    getUserLoginToken();
    
    Timer(const Duration(milliseconds: 3000), () async {
      final SharedPreferences prefs = await _prefs;
      var userLoginToken = prefs.getString('login-token');
      
      if (userLoginToken == null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const OnboardingPage(),
          ),
          (route) => false,
        );
      } else {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreenPage(),
          ),
          (route) => false,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context);
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/splash.gif',
        ),
      ),
    );
  }
}
