import 'package:flutter/material.dart';
import 'package:todo_squirrel/repositories/todo.dart';

class CharacterSettingProvider extends ChangeNotifier {
  final ToDo _toDo = ToDo();

  bool _successGetCharacterSettingInfo = false;
  bool get successGetCharacterSettingInfo => _successGetCharacterSettingInfo;
  Future<void> setCharacterSettingInfo({required int state}) async {
    var result = await _toDo.getToDoList(state: state);

    if(result!.data['success']) {
      if(result.data['todo'].isNotEmpty) {
        _successGetCharacterSettingInfo = true;
        _characterIdx = result.data['todo'][0]['char'];
        _characterGoal = result.data['todo'][0]['goal'];
        _characterName = result.data['todo'][0]['name'];
        _characterStartDate = DateTime.parse(result.data['todo'][0]['created_at'].split('T')[0]);
        _characterEndDate = DateTime.parse(result.data['todo'][0]['finish_date'].split('T')[0]);
        _characterHour = int.parse(result.data['todo'][0]['alarm'].split(':')[0]);
        _characterMinute = int.parse(result.data['todo'][0]['alarm'].split(':')[1].split(':')[0]);
        _characterRangeDate = _characterEndDate.difference(_characterStartDate).inDays;
      } else {
        _successGetCharacterSettingInfo = false;  
      }
    } else {
      _successGetCharacterSettingInfo = false;
    }

    notifyListeners();
  }

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
