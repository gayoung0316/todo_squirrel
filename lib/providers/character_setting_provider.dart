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

  // 선택한 메인 캐릭터 목표를 시작한 날짜
  late DateTime _characterStartDate;
  DateTime get characterStartDate => _characterStartDate;
  set characterStartDate(DateTime value) {
    _characterStartDate = value;
    notifyListeners();
  }

  // 선택한 메인 캐릭터 목표가 끝나는 날짜
  late DateTime _characterEndDate;
  DateTime get characterEndDate => _characterEndDate;
  set characterEndDate(DateTime value) {
    _characterEndDate = value;
    notifyListeners();
  }

  int _characterRangeDate = 0;
  int get characterRangeDate => _characterRangeDate;
  set characterRangeDate(int value) {
    _characterRangeDate = value;
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
