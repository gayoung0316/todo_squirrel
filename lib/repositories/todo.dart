import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDo {
  final Dio _dio = Dio();

  ToDo() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        queryParameters: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        showProcessingTime: true,
        canShowLog: true,
      ),
    );
  }

  Future<Response?> setToDoList(
      {required int characterIdx, required String goal, required String characterName, required String pushAlarm, required String finishDate}) async {
    try {
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

      return response;
    } catch (e) {
      log('투두 리스트 생성 에러 발생 : $e');
    }
  }
}
