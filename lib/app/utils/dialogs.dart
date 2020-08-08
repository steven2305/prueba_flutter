import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'contants.dart';

void messageDialog(String title, String message) => showDialog(
  context: globalContext,
  builder: (_) => AlertDialog(
    title: Center(child: Text("$title")),
    content: Text("$message", textAlign: TextAlign.center),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0)
    ),
    actions: <Widget>[
      FlatButton(
        child: Text("Ok"),
        onPressed: Modular.to.pop,
      )
    ],
  )
);

Future noInternetDialog(Function function) => showDialog<bool>(
  context: globalContext,
  barrierDismissible: false,
  builder: (_) => AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0)
    ),
    title: Center(child: Text("Error")),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Center(
          child: Text("Actualmente no cuentas con conexión a internet\n\n¿Deseas reintentar?", textAlign: TextAlign.center)
        ),
      ],
    ),
    actions: <Widget>[
      FlatButton(
        child: Text("Reintentar"),
        onPressed: () {
          function();
          Modular.to.pop();
        },
      )
    ],
  )
);

void showGlobalToast(String message) => Fluttertoast.showToast(
  msg: "$message",
  toastLength: Toast.LENGTH_SHORT,
  gravity: ToastGravity.BOTTOM,  
  backgroundColor: Colors.grey,
  textColor: Colors.white,
  fontSize: 16.0
);

bool isSesionExpired(String message) => message.toLowerCase().contains('sesion');

void expiredSesionAction() {
  Modular.to.pushReplacementNamed('/');
  showGlobalToast('Sesión expirada, por favor inicia sesión nuevamente');
}