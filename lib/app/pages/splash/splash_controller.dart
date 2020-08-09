import 'package:desarrollo_app_prueba/app/utils/dialogs.dart';
import 'package:desarrollo_app_prueba/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mobx/mobx.dart';

import 'splash_repository.dart';

part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {

  final SplashRepository repository;
  final AppController app;
  _SplashControllerBase(this.repository,this.app);

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

  @action
  Future<void> locations() async {

    if (await Permission.contacts.request().isGranted) {
        Modular.to.pushReplacementNamed("/login");
    }

    Map<Permission, PermissionStatus> statuses = await [
    Permission.location, 
    ].request();
    print(statuses[Permission.location]);

    if (statuses[Permission.location].toString() == 'PermissionStatus.granted') {
        Modular.to.pushReplacementNamed("/login");   
      }else{
        Modular.to.pushReplacementNamed("/");   
      }

  }
  @computed
  Function get loginGo => locations;
}
