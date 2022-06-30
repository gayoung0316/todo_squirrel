import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeProvider extends ChangeNotifier {
  // 하단바 페이지 인덱스
  int _pageIdx = 0;
  int get pageIdx => _pageIdx;
  void setPageIdx(int pageIdx) {
    _pageIdx = pageIdx;
    notifyListeners();
  }

  final PanelController _characterGoalCheckController = PanelController();
  PanelController get characterGoalCheckController => _characterGoalCheckController;

  final PanelController _calenderGoalListController = PanelController();
  PanelController get calenderGoalListController => _calenderGoalListController;

  final PanelController _goalListController = PanelController();
  PanelController get goalListController => _goalListController;

  final PanelController _calenderGoalCheckController = PanelController();
  PanelController get calenderGoalCheckController => _calenderGoalCheckController;

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

  bool _isShowCoachMarks = false;
  bool get isShowCoachMarks => _isShowCoachMarks;
  set isShowCoachMarks(bool value) {
    _isShowCoachMarks = value;
    notifyListeners();
  }

  int _coachMarksNumber = 1;
  int get coachMarksNumber => _coachMarksNumber;
  set coachMarksNumber(int value) {
    _coachMarksNumber = value;
    notifyListeners();
  }
}
