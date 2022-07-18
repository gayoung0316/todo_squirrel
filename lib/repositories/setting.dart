import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting {
  final Dio _dio = Dio();

  Setting() {
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

  // 푸쉬 알림 시간 수정
  Future<Response?> editPushAlarm(
      {required int todoIdx, required String time}) async {
    try {
      const url = "http://13.209.77.164:4001/api/v1/todo/alarm";

      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('login-token');

      Options options = Options(headers: {'authorization': 'Bearer $token'});

      final response = await _dio.patch(
        url,
        data: {
          'todo_idx': todoIdx,
          'time': time,
        },
        options: options,
      );

      return response;
    } catch (e) {
      log('푸쉬 알림 시간 수정 에러 발생 : $e');
    }
  }
}
