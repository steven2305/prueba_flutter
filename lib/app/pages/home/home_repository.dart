import 'package:desarrollo_app_prueba/app/models/userModel.dart';
import 'package:desarrollo_app_prueba/app/preferences/sharedPreferences.dart';
import 'package:desarrollo_app_prueba/app/utils/contants.dart';
import 'package:dio/dio.dart';

class HomeRepository {

  final Dio dio;
  HomeRepository(this.dio);

  final UserPreferences prefs = UserPreferences();

  Future<Map<String, dynamic>> getUsers() async {

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

    final Map<String, dynamic> data = response.data;

    if(response.statusCode != 200 && response.statusCode != 201) return {
      'ok': false,
      'message': '${data['message']}'
    };

    return {
      'ok': true,
      'user': List<User>.from(data['data'].map((x) => User.fromJson(x)))
    };
  }
}