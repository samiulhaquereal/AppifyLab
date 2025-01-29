import 'package:appifylabtask/src/config/import/imports.dart';

class ApiServices {

  static ApiServices? _instance;
  ApiServices._internal();
  factory ApiServices(){
    _instance ??= ApiServices._internal();
    return _instance!;
  }
  final _restApiClient = RestApi();

  Future<Map<String, dynamic>?> userLogin({required String email,required String password}) async {
    final response = await _restApiClient.post(
        baseURL: ApiEndpoints.baseUrlLogin,
        endpoint: ApiEndpoints.endpointLogin,
        needEncode: false,
        body: {
          'email': email,
          'password': password,
          'app_token': '',
        }
    );
    return response;
  }

}