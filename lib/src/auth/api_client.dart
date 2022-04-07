import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future registerUser(Map<String, dynamic>? userData) async {
    try {
      Response response = await _dio.post(
          'https://api.loginradius.com/identity/v2/auth/register', //ENDPONT URL
          data: userData, //REQUEST BODY
          queryParameters: {
            'apikey': '9d8a3c8c-b2cc-4603-a15f-73cfa94d0b30'
          }, //QUERY PARAMETERS
          options: Options(headers: {
            'X-LoginRadius-Sott':
                'rXDBvkf519KXDf28x6TClj/ShJSIO5rlkYrLHfDzE6EpT+tShOzUXTEWJNL1q4OFUqQKdBj/UOtyPeOWuPnRXdxdYrhq5HVsnmLG+/KCc7g=*0c2d0466c2786c1365c8b9ff4b7ad2d4', //HEADERS
          }));

      return Map<String, dynamic>.from(response.data);
    } on DioError catch (e) {
      //returns the error object if there is
      return Map<String, dynamic>.from(e.response!.data);
    }
    //IMPLEMENT USER REGISTRATION
  }

  Future login(String email, String password) async {
    try {
      Response response = await _dio.post(
        'https://api.loginradius.com/identity/v2/auth/login',
        data: {'email': email, 'password': password},
        queryParameters: {'apikey': '9d8a3c8c-b2cc-4603-a15f-73cfa94d0b30'},
      );
      //returns the successful user data json object
      return Map<String, dynamic>.from(response.data);
    } on DioError catch (e) {
      //returns the error object if any
      return Map<String, dynamic>.from(e.response!.data);
    }
  }

  Future getUserProfileData(String accesstoken) async {
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/account',
        queryParameters: {'apikey': '9d8a3c8c-b2cc-4603-a15f-73cfa94d0b30'},
        options: Options(
          headers: {
            'Authorization': 'Bearer $accesstoken',
          },
        ),
      );
      return Map<String, dynamic>.from(response.data);
    } on DioError catch (e) {
      return Map<String, dynamic>.from(e.response!.data);
    }
  }

  Future logout(String accessToken) async {
    try {
      Response response = await _dio.get(
        'https://api.loginradius.com/identity/v2/auth/access_token/InValidate',
        queryParameters: {'apikey': '9d8a3c8c-b2cc-4603-a15f-73cfa94d0b30'},
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
        ),
      );
      return Map<String, dynamic>.from(response.data);
    } on DioError catch (e) {
      return Map<String, dynamic>.from(e.response!.data);
    }
  }

  Future updateUser(Map<String, dynamic>? userData, String accessToken) async {
    try {
      Response response = await _dio.put(
          'https://api.loginradius.com/identity/v2/auth/account',
          data: userData,
          queryParameters: {'apikey': '9d8a3c8c-b2cc-4603-a15f-73cfa94d0b30'},
          options: Options(headers: {'Authorization': 'Bearer $accessToken'}));

      return Map<String, dynamic>.from(response.data);
    } on DioError catch (e) {
      return e.response!.data;
    }
  }
}
