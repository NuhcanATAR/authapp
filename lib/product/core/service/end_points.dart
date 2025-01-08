import 'package:authapp/product/core/service/api.dart';

class EndPoints {
  const EndPoints._();

  static const String loginEndPoint =
      '${ApiService.webHttp}://${ApiService.ipv4}:${ApiService.port}/${ApiService.enpointHead}/login';

  static Uri postLogin() {
    return Uri.parse(loginEndPoint);
  }
}
