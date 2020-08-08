import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:desarrollo_app_prueba/app/app_widget.dart';
import 'package:desarrollo_app_prueba/app/pages/home/home_module.dart';

import 'pages/login/login_module.dart';
import 'pages/splash/splash_module.dart';
//import 'pages/presentation/presentation_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
    Bind((i) => AppController()),
  ];

  @override
  List<Router> get routers => [
    Router(Modular.initialRoute, module: SplashModule()),
    Router('/home',module: HomeModule(), transition: TransitionType.fadeIn),
    Router('/login', module: LoginModule(), transition: TransitionType.fadeIn),
    ];

  @override
  Widget get bootstrap => AppWidget(to.get<AppController>());

  static Inject get to => Inject<AppModule>.of();
}
