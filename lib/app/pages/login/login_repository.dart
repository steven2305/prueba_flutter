//import 'package:desarrollo_app_prueba/app/models/userModel.dart';
import 'package:desarrollo_app_prueba/app/preferences/sharedPreferences.dart';
import 'package:desarrollo_app_prueba/app/utils/contants.dart';
import 'package:dio/dio.dart';

import '../../app_controller.dart';

class LoginRepository {

  final Dio dio;
  final AppController app;
  final UserPreferences prefs;
  LoginRepository(this.dio, this.app, this.prefs);

  Future<Map<String, dynamic>> login(String email, String password) async {

    final Map<String, dynamic> data = {
      'email': '$email',
      'password': '$password'
    };

    Response response;

    try {
      response = await dio.post('/login', data: data);
    } catch (e) {
      return noInternetMessage;
    }

    if(response.statusCode != 200 && response.statusCode != 201) return {
      'ok': false,
      'message': response.data['message']
    };

    // final User user = User.fromJson(response.data['token']);

    // app.user = user;

    prefs.token = response.data['token'];
    prefs.isLogged = true;

    return {
      'ok': true
    };
  }
}