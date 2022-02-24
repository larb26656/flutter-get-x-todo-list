import 'dart:io';

import 'package:dio/dio.dart';

class ErrorCatcher {
  static String getErrorMessage(dynamic e) {
    String message = 'เกิดข้อผิดพลาด กรุณาติดต่อผู้ดูแลระบบ';

    if (e is Exception) {
      if (e is DioError) {
        DioError dioError = e;
        switch (dioError.type) {
          case DioErrorType.connectTimeout:
            message = 'หมดเวลาเชื่อมต่อ กรุณาลองอีกครั้ง';
            break;
          case DioErrorType.sendTimeout:
            message = 'หมดเวลาเชื่อมต่อ กรุณาลองอีกครั้ง';
            break;
          case DioErrorType.receiveTimeout:
            message = 'หมดเวลาเชื่อมต่อ กรุณาลองอีกครั้ง';
            break;
          case DioErrorType.response:
            final int? statusCode = dioError.response!.statusCode;
            switch (statusCode) {
              case 400:
                message = 'เกิดข้อผิดพลาดจากข้อมูล';
                break;
              case 401:
                message = 'ไม่มีสิทธิ์เข้าใช้งาน';
                break;
              case 403:
                message = 'ไม่มีสิทธิ์เข้าใช้งาน';
                break;
              case 500:
                message = 'เกิดข้อผิดพลาดจากเซิฟเวอร์';
                break;
            }
            break;
          case DioErrorType.cancel:
            break;
          case DioErrorType.other:
            if (dioError.error is SocketException) {
              message = 'เชื่อมต่อเซิฟเวอร์ไม่ได้';
            }
            break;
        }


      }
    }

    return message;
  }
}