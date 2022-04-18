import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  // 하단바 페이지 인덱스
  int _pageIdx = 0;
  int get pageIdx => _pageIdx;
  set pageIdx(int value) {
    _pageIdx = value;
    notifyListeners();
  }
}
