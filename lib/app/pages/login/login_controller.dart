import 'package:desarrollo_app_prueba/app/app_controller.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:desarrollo_app_prueba/app/utils/dialogs.dart';
import 'package:desarrollo_app_prueba/app/pages/login/login_repository.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  final LoginRepository loginRepository;
  final AppController app;

  _LoginControllerBase(this.loginRepository, this.app);

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @observable
  bool inputE = true;

  @action
  void changeImage() => inputE = !inputE;

  @action
  void setPassword(String value) => password = value;

  @observable
  bool passwordVisible = false;

  @action
  void changePasswordVisibility() => passwordVisible = !passwordVisible;

  @observable
  bool loading = false;

  @action
  Future<void> login() async {

    loading = true;

    final Map<String, dynamic> response = await loginRepository.login(email, password);

    loading = false;

    if(!response["ok"]) {
      if(response["message"] == "no-wifi") return noInternetDialog(login);
      return messageDialog("No autorizado", "${response["message"]}"); 
    }

    Modular.to.pushReplacementNamed("/home");
    showGlobalToast('Bienvenido');
  }

  @computed
  Function get loginPressed => (loading || (!isEmailValid || !isPasswordValid)) ? null : login;

  @computed
  bool get isEmailValid => RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  double get buttonWitdh => (!loading) ? 0.20 : 0.30;
}
