import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  
  static final UserPreferences _singleton = UserPreferences._();

  factory UserPreferences() => _singleton;

  UserPreferences._();

  SharedPreferences _prefs;

  Future<void> initPrefs() async => _prefs = await SharedPreferences.getInstance();

  // int get id => _prefs.getInt("_id") ?? "";
  // set id(int id) => _prefs.setInt("_id", id);

  String get token => _prefs.getString("_token") ?? "";
  set token(String token) => _prefs.setString("_token", token);

  bool get isLogged => _prefs.getBool("_isLogged") ?? false;
  set isLogged(bool isLogged) => _prefs.setBool("_isLogged", isLogged);

}