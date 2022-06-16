import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDo {
  final Dio _dio = Dio();

  Future<Response?> setToDoList(
      {required int characterIdx, required String goal, required String characterName, required String pushAlarm, required String finishDate}) async {
    try {
      log('api 호출 시작');
      const url = "http://13.209.77.164:4001/api/v1/todo";

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('login-token');
      
      Options options = Options(
        headers: {'authorization':'Bearer $token'}
      );

      final response = await _dio.post(
        url,
        options: options,
        data: {
          'char': characterIdx,
          'goal': goal,
          'char_name': characterName,
          'alarm': pushAlarm,
          'finish': finishDate,
        },
      );
      print(response);
      return response;
    } catch (e) {
      log('투두 리스트 생성 에러 발생 : $e');
    }
  }

  Future<Response?> getToDoList({required int state}) async {
    /*
      state 
      0 : 진행 중
      1 : 명예
      2 : 우울
    */
    try {
      log('api 호출 시작');
      const url = "http://13.209.77.164:4001/api/v1/todo";

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('login-token');
      
      Options options = Options(
        headers: {'authorization':'Bearer $token'}
      );

      final response = await _dio.get(
        url,
        options: options,
        queryParameters: {'state' : state},
      );
      print(response);
      return response;
    } catch (e) {
      log('투두 리스트 생성 에러 발생 : $e');
    }
  }
}
