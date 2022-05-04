import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeProvider extends ChangeNotifier {
  // 하단바 페이지 인덱스
  int _pageIdx = 0;
  int get pageIdx => _pageIdx;
  set pageIdx(int value) {
    _pageIdx = value;
    notifyListeners();
  }

  final PanelController _characterGoalCheckController = PanelController();
  PanelController get characterGoalCheckController =>
      _characterGoalCheckController;

  final PanelController _calenderGoalCheckController = PanelController();
  PanelController get calenderGoalCheckController =>
      _calenderGoalCheckController;

  num _calenderGoalCheckControllerPosition = 0.0;
  num get calenderGoalCheckControllerPosition =>
      _calenderGoalCheckControllerPosition;
  set calenderGoalCheckControllerPosition(num value) {
    _calenderGoalCheckControllerPosition = value;
    notifyListeners();
  }

  bool _calenderGoalCheckMemo = false;
  bool get calenderGoalCheckMemo => _calenderGoalCheckMemo;
  set calenderGoalCheckMemo(bool value) {
    _calenderGoalCheckMemo = value;
    notifyListeners();
  }

  int _calenderGoalSuccess = 0;
  int get calenderGoalSuccess => _calenderGoalSuccess;
  set calenderGoalSuccess(int value) {
    _calenderGoalSuccess = value;
    notifyListeners();
  }

  bool _isButtonTapped = false;
  bool get isButtonTapped => _isButtonTapped;
  set isButtonTapped(bool value) {
    _isButtonTapped = value;
    notifyListeners();
  }
}
