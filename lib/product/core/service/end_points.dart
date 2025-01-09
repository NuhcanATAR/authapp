import 'package:authapp/product/core/service/api.dart';

class EndPoints {
  const EndPoints._();

  static const String signInEndPoint =
      '${ApiService.webHttp}://${ApiService.ipv4}:${ApiService.port}/${ApiService.enpointHead}/login';

  static const String signUpEndPoint =
      '${ApiService.webHttp}://${ApiService.ipv4}:${ApiService.port}/${ApiService.enpointHead}/register';

  static const String profileEndPoint =
      '${ApiService.webHttp}://${ApiService.ipv4}:${ApiService.port}/${ApiService.enpointHead}/profile';

  static Uri uriParse(String endPoint) {
    return Uri.parse(endPoint);
  }
}
