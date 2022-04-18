import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_squirrel/character_setting/character_date_setting.dart';
import 'package:todo_squirrel/components/triangle_clipper.dart';
import 'package:todo_squirrel/model/squirrel_Character.dart';
import 'package:todo_squirrel/providers/character_setting_provider.dart';

class CharacterNameGoalSettingPage extends StatefulWidget {
  const CharacterNameGoalSettingPage({Key? key}) : super(key: key);
  @override
  State<CharacterNameGoalSettingPage> createState() =>
      _CharacterNameGoalSettingPageState();
}

class _CharacterNameGoalSettingPageState
    extends State<CharacterNameGoalSettingPage> {
  late ScrollController _scrollController;
  late CharacterSettingProvider characterSettingProvider;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _goalController = TextEditingController();

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    characterSettingProvider = Provider.of<CharacterSettingProvider>(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor:
            squirrelCharacter[characterSettingProvider.characterIdx]
                ['character_color'],
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 57.h, left: 20.w),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    _nameController.clear();
                    _goalController.clear();
                    FocusScope.of(context).unfocus();
                  },
                  child: Image.asset(
                    'assets/icons/arrow_left.png',
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 70.h),
                    SizedBox(
                      height: 52.h,
                      child: Stack(
                        children: [
                          Container(
                            width: 308.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.w),
                              color: const Color.fromRGBO(255, 255, 255, 1),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '“ 내 이름과 너의 목표를 적어줘! “',
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                color: squirrelCharacter[
                                        characterSettingProvider.characterIdx]
                                    ['character_color'],
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 46.w,
                            child: ClipPath(
                              clipper: TriangleClipper(),
                              child: Container(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                height: 12.w,
                                width: 12.w,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 38.h),
                    Image.asset(
                      'assets/images/character_select_squirrel_${characterSettingProvider.characterIdx}.png',
                      width: 284.w,
                      height: 284.w,
                    ),
                    SizedBox(height: 60.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '내 이름은',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(width: 14.w),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                width: 1.w,
                              ),
                            ),
                          ),
                          width: 146.w,
                          child: TextField(
                            controller: _nameController,
                            textAlign: TextAlign.center,
                            maxLength: 8,
                            style: TextStyle(
                              color: const Color.fromRGBO(255, 255, 255, 0.5),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            onTap: () {
                              _scrollController.animateTo(
                                140.h,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            decoration: InputDecoration(
                              isCollapsed: true,
                              contentPadding: EdgeInsets.only(bottom: 6.h),
                              counterText: '',
                              hintText: squirrelCharacter[
                                      characterSettingProvider.characterIdx]
                                  ['character_name'],
                              hintStyle: TextStyle(
                                color: const Color.fromRGBO(255, 255, 255, 0.5),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(width: 14.w),
                        Text(
                          '이고,',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40.h),
                    SizedBox(
                      width: 286.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '내 목표는',
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  width: 1.w,
                                ),
                              ),
                            ),
                            width: 286.w,
                            child: TextField(
                              controller: _goalController,
                              textAlign: TextAlign.center,
                              maxLength: 24,
                              style: TextStyle(
                                color: const Color.fromRGBO(255, 255, 255, 0.5),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              onTap: () {
                                _scrollController.animateTo(
                                  140.h,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              onChanged: (value) {
                                setState(() {});
                              },
                              decoration: InputDecoration(
                                isCollapsed: true,
                                contentPadding: EdgeInsets.only(bottom: 6.h),
                                counterText: '',
                                hintStyle: TextStyle(
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 0.5),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 63.h),
                    InkWell(
                      onTap: () {
                        if (_nameController.text.isNotEmpty) {
                          characterSettingProvider.characterName =
                              _nameController.text;
                        } else {
                          characterSettingProvider.characterName =
                              squirrelCharacter[characterSettingProvider
                                  .characterIdx]['character_name'];
                        }
                        if (_goalController.text.isNotEmpty) {
                          characterSettingProvider.characterGoal =
                              _goalController.text;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CharacterDateSetting(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: 76.w,
                        height: 42.h,
                        decoration: BoxDecoration(
                          color: _goalController.text.isEmpty
                              ? const Color.fromRGBO(255, 255, 255, 0.5)
                              : const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(21.w),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '다음',
                          textScaleFactor: 1.0,
                          style: TextStyle(
                            color: squirrelCharacter[characterSettingProvider
                                .characterIdx]['character_color'],
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
