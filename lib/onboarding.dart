import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int index = 0;

  final List<String> _squirrelTextList = [
    '반가워! 나는 토리야',
    '혼자 목표를 달성하는건\n정말 쉽지 않은 일인 것 같아…',
    '나와 내 친구들이 너의 목표를\n이룰 수 있도록 도와줄게!',
    '이제 내 친구들을\n만나러 가볼까?',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (index <= 2) {
          setState(() {
            index += 1;
          });
        }
      },
      child: Scaffold(
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _squirrelTextList[index],
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'NanumSquareRound',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Image.asset(
                    'assets/images/squirrel_$index.png',
                    width: 290,
                    height: 250,
                  ),
                ],
              ),
              Visibility(
                visible: index == 3,
                child: const Positioned(
                  bottom: 174,
                  child: Text(
                    '시작하기',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'NanumSquareRound',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
