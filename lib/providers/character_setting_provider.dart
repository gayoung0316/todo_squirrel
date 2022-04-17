import 'package:flutter/material.dart';

class CharacterSettingProvider extends ChangeNotifier {
  // 선택한 메인 캐릭터 인덱스
  int _characterIdx = 0;
  int get characterIdx => _characterIdx;
  set characterIdx(int value) {
    _characterIdx = value;
    notifyListeners();
  }

  // 선택한 메인 캐릭터의 이름
  String _characterName = '';
  String get characterName => _characterName;
  set characterName(String value) {
    _characterName = value;
    notifyListeners();
  }

  // 선택한 메인 캐릭터의 목표
  String _characterGoal = '';
  String get characterGoal => _characterGoal;
  set characterGoal(String value) {
    _characterGoal = value;
    notifyListeners();
  }

  // 선택한 메인 캐릭터 목표를 진행할 날짜
  int _characterDate = 0;
  int get characterDate => _characterDate;
  set characterDate(int value) {
    _characterDate = value;
    notifyListeners();
  }

  // 선택한 메인 캐릭터 목표를 체크할 시간
  int _characterHour = 0;
  int get characterHour => _characterHour;
  set characterHour(int value) {
    _characterHour = value;
    notifyListeners();
  }

  // 선택한 메인 캐릭터 목표를 체크할 분
  int _characterMinute = 0;
  int get characterMinute => _characterMinute;
  set characterMinute(int value) {
    _characterMinute = value;
    notifyListeners();
  }
}
