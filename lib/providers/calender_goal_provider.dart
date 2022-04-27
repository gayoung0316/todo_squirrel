import 'package:flutter/material.dart';

class CalenderGoalProvider extends ChangeNotifier {
  // 현재 달력 페이지의 연도
  int _calenderPageYear = 2022;
  int get calenderPageYear => _calenderPageYear;
  set calenderPageYear(int value) {
    _calenderPageYear = value;
    notifyListeners();
  }

  // 현재 달력 페이지의 달
  int _calenderPageMonth = 0;
  int get calenderPageMonth => _calenderPageMonth;
  set calenderPageMonth(int value) {
    _calenderPageMonth = value;
    notifyListeners();
  }
}
