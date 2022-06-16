import 'dart:developer';
import 'package:dio/dio.dart';

class Sign {
  final Dio _dio = Dio();

  Future<Response?> signIn(
      {required int platform, required String token}) async {
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
}
