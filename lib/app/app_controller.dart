import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'models/userModel.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {


  @observable
  User user;

  @computed
  Color get primaryColor =>  Color(0xff1A1A1A);

  @computed
  Color get secondaryColor => Colors.white;

  @computed
  Color get backgroundColor => Color(0xffFEDD7C);

  @computed
  Color get textColor => Color(0xff000000);



}
