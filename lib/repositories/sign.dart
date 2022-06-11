import 'dart:developer';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';

class Sign {
  final Dio _dio = Dio();

  Sign() {
    Dio().interceptors.add(
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
            compact: false,
          ),
        );
  }

  Future<Response?> signIn(
      {required int platform, required String token}) async {
    try {
      const url = "http://13.209.77.164:4001/api/v1/user/login";
      Options options = Options(contentType: 'application/json');
      log('안녕 : 12');
      final response = await _dio.post(
        url,
        options: options,
        data: {
          'platform': platform,
          'token': token,
        },
      );
      log('아ㄴ녕하세요');
      log('안녕 : $response');

      return response;
    } catch (e) {
      log('회원가입 에러 발생 : $e');
    }
  }
}
