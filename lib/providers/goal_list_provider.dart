import 'package:flutter/material.dart';
import 'package:todo_squirrel/repositories/todo.dart';

class GoalListProvider extends ChangeNotifier {
  final ToDo _toDo = ToDo();

  final List<Map<String, dynamic>> _successGoalList = [];
  List<Map<String, dynamic>> get successGoalList => _successGoalList;
  void getSuccessGoalList({required int state}) async {
    var result = await _toDo.getToDoList(state: state);
    
    if(result!.data['success']) {
      if(result.data['todo'].isNotEmpty) {
        result.data['todo'].forEach((item) {
          _successGoalList.add(item);
        });
      }
    }

    notifyListeners();
  }

  final List<Map<String, dynamic>> _failureGoalList = [];
  List<Map<String, dynamic>> get failureGoalList => _failureGoalList;
  void getfailureGoalList({required int state}) async {
    var result = await _toDo.getToDoList(state: state);
    
    if(result!.data['success']) {
      if(result.data['todo'].isNotEmpty) {
        result.data['todo'].forEach((item) {
          _failureGoalList.add(item);
        });
      }
    }

    notifyListeners();
  }

  final List<Map<String, dynamic>> _calenderGoalList = [];
  List<Map<String, dynamic>> get calenderGoalList => _calenderGoalList;

  final List<Map<String, dynamic>> _calenderCheckGoalList = [];
  List<Map<String, dynamic>> get calenderCheckGoalList => _calenderCheckGoalList;
  void setCharacterGoalCalenderList() async {
    _calenderCheckGoalList.clear();
    var result = await _toDo.getCalenderGoalList();

    if(result!.data['success']) {
      result.data['calendar'].forEach((item) {
        _calenderGoalList.add(item);

        item['daily'].forEach((item) {
          _calenderCheckGoalList.add(item);
        });
      });
    }

    notifyListeners();
  }
}
