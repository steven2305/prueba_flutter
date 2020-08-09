import 'package:desarrollo_app_prueba/app/utils/contants.dart';

import '../../app_controller.dart';
import 'splash_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'splash_page.dart';
import 'splash_repository.dart';

class SplashModule extends ChildModule {
  
  @override
  List<Bind> get binds => [
    Bind((i) => SplashController(i.get<SplashRepository>(), i.get<AppController>())),
    Bind((i) => SplashRepository(i.get<Dio>(), i.get<AppController>())),
    Bind((i) => Dio(baseOptions))
  ];

  @override
  List<Router> get routers => [
    Router(Modular.initialRoute, child: (_, args) => SplashPage()),
  ];

  static Inject get to => Inject<SplashModule>.of();
}
