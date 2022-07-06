import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sign {
  final Dio _dio = Dio();

  Sign() {
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

  Future<Response?> signIn({required int platform, required String token}) async {
    try {
      const url = "http://13.209.77.164:4001/api/v1/user/login";
      Options options = Options(contentType: 'application/json');
      final response = await _dio.post(
        url,
        options: options,
        data: {
          'platform': platform,
          'token': token,
        },
      );
      return response;
    } catch (e) {
      log('회원가입 에러 발생 : $e');
    }
  }

  Future<Response?> leaveUser() async {
    try {
      const url = "http://13.209.77.164:4001/api/v1/user";
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('login-token');
      
      Options options = Options(
        headers: {'authorization':'Bearer $token'}
      );
      
      final response = await _dio.delete(
        url,
        options: options,
      );
      return response;
    } catch (e) {
      log('회원탈퇴 에러 발생 : $e');
    }
  }
}
