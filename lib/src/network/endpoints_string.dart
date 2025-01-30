import 'package:appifylabtask/src/config/import/imports.dart';

class ApiEndpoints{
  static final baseUrlLogin = '${dotenv.env['LOGIN_BASE_URL']}';
  static final baseUrl = '${dotenv.env['BASE_URL']}';
  static final endpointLogin = '${dotenv.env['ENDPOINT_LOGIN']}';
  static final endpointNewsFeed = '${dotenv.env['ENDPOINT_NEWS_FEED']}';
  static final endpointLogout = '${dotenv.env['ENDPOINT_LOGOUT']}';
  static final endpointLike = '${dotenv.env['ENDPOINT_LIKE']}';



}