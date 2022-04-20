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

  bool _isButtonTapped = false;
  bool get isButtonTapped => _isButtonTapped;
  set isButtonTapped(bool value) {
    _isButtonTapped = value;
    notifyListeners();
  }
}
