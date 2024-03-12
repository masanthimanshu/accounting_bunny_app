import 'package:accounting_bunny/network/endpoints.dart';
import 'package:accounting_bunny/network/requests.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InterceptorMethods with HTTPRequests {
  final _hive = Hive.box("myBox");

  Future<void> refreshToken() async {
    final data = await getRequest(apiEndpoint(ApiEndpoints.refreshToken));
    if (data != null) _hive.put("authToken", data["authToken"]);
  }

  Future<Response<dynamic>> retryRequest(
    RequestOptions requestOptions,
    Dio dioHandler,
  ) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );

    return dioHandler.request(
      options: options,
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
    );
  }
}
