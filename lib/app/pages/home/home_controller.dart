import 'package:desarrollo_app_prueba/app/models/userModel.dart';
import 'package:desarrollo_app_prueba/app/pages/home/home_repository.dart';
import 'package:desarrollo_app_prueba/app/utils/dialogs.dart';
import 'package:mobx/mobx.dart';

import '../../app_controller.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  final AppController app;
  final HomeRepository homeRepository;

  _HomeControllerBase(this.app, this.homeRepository) {
    getAlData();
  }
  @observable
  String titulo = 'HOME';

  @action
  String setTitulo(String value)  => titulo = value;
  
  @observable
  List<User> user;

  @action
  Future<void> getAlData() async {

    final Map<String, dynamic> response = await homeRepository.getUsers();

    if(!response['ok']) {
      if(response["message"] == "no-wifi") return noInternetDialog(getAlData);
      else if(isSesionExpired(response['message'])) expiredSesionAction();
      else showGlobalToast('Ha ocurrido un error, por favor intente más tarde');
    }

    user = response['user'];
  
  }
  
}
