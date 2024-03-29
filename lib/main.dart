import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:provider/provider.dart';
import 'package:todo_squirrel/providers/calender_goal_check_provider.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';
import 'package:todo_squirrel/providers/goal_list_provider.dart';
import 'package:todo_squirrel/providers/home_provider.dart';
import 'screens/prologue/splash_page.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CharacterSettingProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => GoalListProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CalenderGoalCheckProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) => MaterialApp(
        title: 'Squirrel ToDo List',
        home: const SplashPage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'NanumSquareRound',
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
      ),
    );
  }
}
