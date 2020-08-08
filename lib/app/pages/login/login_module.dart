import 'package:desarrollo_app_prueba/app/preferences/sharedPreferences.dart';
import 'package:desarrollo_app_prueba/app/utils/contants.dart';

import '../../app_controller.dart';
import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'login_page.dart';
import 'login_repository.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => LoginController(i.get<LoginRepository>(), i.get<AppController>())),
    Bind((i) => LoginRepository(i.get<Dio>(), i.get<AppController>(), i.get<UserPreferences>())),
    Bind((i) => UserPreferences()),
    Bind((i) => Dio(baseOptions)),
  ];

  @override
  List<Router> get routers => [
    Router(Modular.initialRoute, child: (_, args) => LoginPage()),
  ];

  static Inject get to => Inject<LoginModule>.of();
}
