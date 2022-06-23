import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_squirrel/prologue/auth/sign_in.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _pageIdx = 0;
  final PageController _pageController = PageController();

  final List<String> _squirrelTextList = [
    '반가워! 나는 토리야',
    '혼자 목표를 달성하는건\n정말 쉽지 않은 일인 것 같아…',
    '나와 내 친구들이 너의 목표를\n이룰 수 있도록 도와줄게!',
    '이제 내 친구들을\n만나러 가볼까?',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: 4,
            onPageChanged: (value) {
              setState(() {
                _pageIdx = value;
              });
            },
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _squirrelTextList[index],
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Image.asset(
                    'assets/images/onboarding_squirrel_$index.png',
                    width: 290,
                    height: 250,
                  ),
                ],
              );
            },
          ),
          Positioned(
            bottom: 193.h,
            child: _pageIdx == 3
                ? InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                    ),
                    child: Container(
                      width: 112.w,
                      height: 42.h,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(21.w),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 0, 0, 0.16),
                            offset: const Offset(1, 2),
                            blurRadius: 6.w,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        '시작하기',
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  )
                : SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: SlideEffect(
                      spacing: 9.w,
                      radius: 4.0,
                      dotWidth: 10.w,
                      dotHeight: 10.w,
                      dotColor: const Color.fromRGBO(208, 208, 208, 1),
                      activeDotColor: const Color.fromRGBO(205, 240, 174, 1),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
