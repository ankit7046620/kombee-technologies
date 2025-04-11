import 'package:dio/dio.dart' as diopackage;
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class APIServices {
  static dynamic getMethodWithoutHeaderDio({String? apiUrl, bool isShowLoader = true, Map<String, dynamic>? queryData, bool? headerChange}) async {
    if (isShowLoader) {
      EasyLoading.show(maskType: EasyLoadingMaskType.black);
    }

    var dio = diopackage.Dio();
    try {
      final response = await dio.get(
        apiUrl!,
        queryParameters: queryData,
        options: diopackage.Options(
          validateStatus: (_) => true,
        ),
      );
      if (isShowLoader) {
        EasyLoading.dismiss();
      }
      if (kDebugMode) {
        print(response);
      }
      return response;
    } catch (exception) {
      EasyLoading.dismiss();
      if (kDebugMode) {
        print(exception);
      }
      if (exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }
}
