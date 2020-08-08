import 'package:desarrollo_app_prueba/app/utils/dialogs.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'splash_repository.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {

  final SplashRepository repository;
  _SplashControllerBase(this.repository);

  Future<void> fetchData() async {

    final Map<String, dynamic> response = await repository.fetchData();

    if(!response['ok']) {
      if(response["message"] == "no-wifi") return noInternetDialog(fetchData);
      if(response["message"] == "expired") {
        Modular.to.pushReplacementNamed('/login');
        return messageDialog("Lo sentimos", 'Tu sesión se ha expirado\nPor favor, inicia sesión nuevamente');
      }
      return messageDialog("error", response['message']);
    }

    Modular.to.pushReplacementNamed("/");
  }
}
