import 'package:desarrollo_app_prueba/app/models/userModel.dart';
import 'package:desarrollo_app_prueba/app/preferences/sharedPreferences.dart';
import 'package:desarrollo_app_prueba/app/utils/contants.dart';
import 'package:dio/dio.dart';

import '../../app_controller.dart';

class SplashRepository {

  final Dio dio;
  final AppController app;
  SplashRepository(this.dio, this.app);

  final UserPreferences prefs = UserPreferences();

  Future<Map<String, dynamic>> fetchData() async {
    
    Response response;

    final Map<String, dynamic> headers = {
      "Content-Type": "application/json",
      "Authorization" : "${prefs.token}",
    };

    try {
      response = await dio.get('/users', options: Options(headers: headers));
    } catch (e) {
      return noInternetMessage;
    }

    if(response.statusCode != 200 && response.statusCode != 201) return {
      'ok': false,
      'message': 'expired'
    };

    final User user = User.fromJson(response.data['user']);

    app.user = user;

    return {
      'ok': true
    };

  }
}