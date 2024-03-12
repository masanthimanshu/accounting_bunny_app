import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import './methods.dart';

class DioInterceptor extends Interceptor {
  final Dio dioHandler;

  final _hive = Hive.box("myBox");
  final _methods = InterceptorMethods();

  DioInterceptor({required this.dioHandler});

  @override
  void onRequest(options, handler) {
    options.headers.addAll({
      "Refresh": _hive.get("refreshToken"),
      "Authorization": _hive.get("authToken"),
    });

    super.onRequest(options, handler);
  }

  @override
  void onError(err, handler) async {
    if (err.response?.statusCode == 401) {
      try {
        await _methods.refreshToken();
        handler.resolve(await _methods.retryRequest(
          err.requestOptions,
          dioHandler,
        ));
      } catch (err) {
        debugPrint("Error occurred with Interceptor - $err");
        return null;
      }
    }

    super.onError(err, handler);
  }
}
