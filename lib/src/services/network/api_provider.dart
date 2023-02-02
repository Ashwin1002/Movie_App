import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';

import '../../constant/api_constant.dart';

class APIProvider {
  static getAPI({required String endPoint}) async {
    try {
      late String api = ConstantAPIText.baseUrl + endPoint;
      Response response = await Dio().get(api);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        log( " API Provider SOCKET EXCEPTION $e ");
        return ConstantAPIText.errorNetworkMap;
      } else {
        log(" API Provider ERROR $e ");
        return ConstantAPIText.errorMap;
      }
    }
  }

  static postAPI({required String endPoint, required String body}) async {
    late String api = ConstantAPIText.baseUrl + endPoint;
    try {
      var headers = {'Content-Type': 'application/json'};
      Response response =
          await Dio().post(api, data: body, queryParameters: headers);

      log( "StatusCode is ${response.statusCode}");

      ///
      log("$api $body");

      ///
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return response.data;
      }
    } on DioError catch (e) {
      if (e.error is SocketException) {
        log(" API Provider SOCKET EXCEPTION $e ");
        return ConstantAPIText.errorNetworkMap;
      } else {
        log(" API Provider ERROR $e ");
        return ConstantAPIText.errorMap;
      }
    }
  }
}
