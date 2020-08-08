import 'package:desarrollo_app_prueba/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {

  final AppController controller;
  const AppWidget(this.controller);

  
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
        navigatorKey: Modular.navigatorKey,
        title: 'App Prueba',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: controller.primaryColor,
          secondaryHeaderColor: controller.secondaryColor,
          scaffoldBackgroundColor: controller.backgroundColor,
          fontFamily: 'Montserrat',          
        ),
        initialRoute: '/',
        onGenerateRoute: Modular.generateRoute
      );
      }
    
  
}
