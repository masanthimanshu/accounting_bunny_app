import 'package:accounting_bunny/model/profile/profile_model.dart';
import 'package:accounting_bunny/network/endpoints.dart';
import 'package:accounting_bunny/network/requests.dart';

class ProfileController with HTTPRequests {
  Future<ProfileModel?> getProfile() async {
    final res = await getRequest(apiEndpoint(ApiEndpoints.getProfile));

    if (res != null) return ProfileModel.fromJson(res);
    return null;
  }
}
