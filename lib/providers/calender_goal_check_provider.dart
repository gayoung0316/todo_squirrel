import 'package:flutter/material.dart';

class CalenderGoalCheckProvider extends ChangeNotifier {
  String _goalCheckDay = '';
  String get goalCheckDay => _goalCheckDay;
  set goalCheckDay(String value) {
    _goalCheckDay = value;
    notifyListeners();
  }

  bool _goalCheckSuccess = false;
  bool get goalCheckSuccess => _goalCheckSuccess;
  set goalCheckSuccess(bool value) {
    _goalCheckSuccess = value;
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
