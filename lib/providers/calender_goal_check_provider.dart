import 'package:flutter/material.dart';

class CalenderGoalCheckProvider extends ChangeNotifier {
  String _goalCheckDay = '';
  String get goalCheckDay => _goalCheckDay;
  set goalCheckDay(String value) {
    _goalCheckDay = value;
    notifyListeners();
  }

  /*
    0 : 미수행
    1 : 수행
    2 : 아직 해당 날짜 지나지 않음
  */
  int _goalCheckSuccess = 2;
  int get goalCheckSuccess => _goalCheckSuccess;
  set goalCheckSuccess(int value) {
    _goalCheckSuccess = value;
    notifyListeners();
  }

  late int _goalCheckListIdx;
  int get goalCheckListIdx => _goalCheckListIdx;
  set goalCheckListIdx(int value) {
    _goalCheckListIdx = value;
    notifyListeners();
  }

  String _goalMemo = '';
  String get goalMemo => _goalMemo;
  set goalMemo(String value) {
    _goalMemo = value;
    notifyListeners();
  }

  bool _goalMemoIsNotEmpty = false;
  bool get goalMemoIsNotEmpty => _goalMemoIsNotEmpty;
  set goalMemoIsNotEmpty(bool value) {
    _goalMemoIsNotEmpty = value;
    notifyListeners();
  }

  bool _goalMemoTextFieldTapped = false;
  bool get goalMemoTextFieldTapped => _goalMemoTextFieldTapped;
  set goalMemoTextFieldTapped(bool value) {
    _goalMemoTextFieldTapped = value;
    notifyListeners();
  }

  bool _goalListIsPanelOpen = false;
  bool get goalListIsPanelOpen => _goalListIsPanelOpen;
  set goalListIsPanelOpen(bool value) {
    _goalListIsPanelOpen = value;
    notifyListeners();
  }

  final FocusNode _goalMemoFocusNode = FocusNode();
  FocusNode get goalMemoFocusNode => _goalMemoFocusNode;

  final TextEditingController _goalMemoController = TextEditingController();
  TextEditingController get goalMemoController => _goalMemoController;
}
