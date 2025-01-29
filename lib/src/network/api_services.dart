import 'package:appifylabtask/src/config/import/imports.dart';

class ApiServices {

  static ApiServices? _instance;
  ApiServices._internal();
  factory ApiServices(){
    _instance ??= ApiServices._internal();
    return _instance!;
  }
  final _restApiClient = RestApi();

  /*Future<Map<String, dynamic>?> userLogin({required String data}) async {
    final response = await _restApiClient.post(
        baseURL: AppEnvironment.environment == Environment.development ? baseUrlDev : AppEnvironment.baseUrl,
        endpoint: endpointLogin,
        needEncode: false,
        body: {
          'data': data
        }
    );
    return response;
  }*/

}