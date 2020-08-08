import 'package:desarrollo_app_prueba/app/pages/home/home_repository.dart';
import 'package:desarrollo_app_prueba/app/utils/contants.dart';
import 'package:dio/dio.dart';

import '../../app_controller.dart';
import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
    Bind((i) => HomeController(i.get<AppController>(), i.get<HomeRepository>())),
    Bind((i) => HomeRepository(i.get<Dio>())),
    Bind((i) => Dio(baseOptions)),
  ];

  @override
  List<Router> get routers => [
    Router(Modular.initialRoute, child: (_, args) => HomePage()),
  ];

  static Inject get to => Inject<HomeModule>.of();
}
