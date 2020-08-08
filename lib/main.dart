import 'package:flutter/material.dart';
import 'package:desarrollo_app_prueba/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/preferences/sharedPreferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final UserPreferences prefs = UserPreferences();
  await prefs.initPrefs();
  Modular.debugMode = false;

  
  runApp(ModularApp(module: AppModule()));
}