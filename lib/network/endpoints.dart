enum ApiEndpoints { baseUrl, login, signup, getProfile, refreshToken }

String apiEndpoint(ApiEndpoints endpoint) {
  switch (endpoint) {
    case ApiEndpoints.baseUrl:
      return "http://10.0.2.2:3000/";

    case ApiEndpoints.refreshToken:
      return "token/refresh";

    case ApiEndpoints.login:
      return "auth/login";

    case ApiEndpoints.signup:
      return "auth/signup";

    case ApiEndpoints.getProfile:
      return "secure/profile/data";
  }
}
