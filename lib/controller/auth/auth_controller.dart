import 'package:accounting_bunny/network/endpoints.dart';
import 'package:accounting_bunny/network/requests.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthController with HTTPRequests {
  final _hive = Hive.box("myBox");

  Future<bool> login(Map<String, dynamic> data) async {
    final res = await postRequest(
      url: apiEndpoint(ApiEndpoints.login),
      payload: data,
    );

    if (res != null) {
      _hive.put("authToken", res["authToken"]);
      _hive.put("refreshToken", res["refreshToken"]);
      return true;
    }

    return false;
  }
}
