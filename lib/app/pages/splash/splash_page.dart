import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../app_controller.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {

  final AppController appController = Modular.get<AppController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BodyWidget(appController),
        ],
      ),
    );
  }
}

class BodyWidget extends StatelessWidget {
  final AppController appController;
  const BodyWidget(this.appController);
  
  @override
  Stack build(BuildContext context) => Stack(
  children: <Widget>[
    Positioned(
      bottom: MediaQuery.of(context).size.height * -0.60,
      left: MediaQuery.of(context).size.width * -0.15,
      child: Align(
      alignment: FractionalOffset.bottomCenter,
      child: Image(
        image: AssetImage("assets/image.png")
        ),
      ),
    ),
    ListView(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.30),
        children: <Widget>[
          Center(child: Text('USERAPP', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 28,fontFamily: 'Montserrat'))),
          Center(
            child:Container(
              padding: EdgeInsets.fromLTRB(40, 15, 40, 15),
              child: Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.', 
              style: TextStyle(fontSize: 18, fontFamily: 'Montserrat'), textAlign: TextAlign.center, 
              )
            )
          ),
          _LoginButton(appController),
        ],
      ),
 
  ],
  );
}

class _LoginButton extends StatelessWidget {

  final AppController appController;
  const _LoginButton(this.appController);

  @override
  Observer build(BuildContext context) => Observer(
    builder: (_) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text('IR A LOGIN', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat',fontSize: 18)),
        color: appController.primaryColor,
        elevation: 0.0,
        shape: StadiumBorder(),
        onPressed: () => Modular.to.pushNamed('/login')
      ),
    )
  );
}

