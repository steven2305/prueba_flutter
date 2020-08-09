import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final LoginController controller = Modular.get<LoginController>();

  @override
  Scaffold build(BuildContext context) => Scaffold(
    backgroundColor: controller.app.backgroundColor,
    resizeToAvoidBottomInset: false,
    body: Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: double.infinity,
          width: double.infinity,
        ),
        Positioned(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
              child: FormBody(controller),
          )
        ),
          AppImage(controller) 

      ],
    ),
  );
}

class AppImage extends StatelessWidget {
  final LoginController controller;
  const AppImage(this.controller);

  @override
  Observer build(BuildContext context) => Observer(
    builder: (_) => Positioned(
    top: MediaQuery.of(context).size.height * 0.12,
      child: 
      (controller.inputE == true) ?
      Container(
          height: MediaQuery.of(context).size.height * 0.50,
          padding: EdgeInsets.all(7.0),
          child: Image.asset('assets/image.png')
          )
          :
      Container()
  ),
  );
}

class FormBody extends StatelessWidget {

  final LoginController controller;
  const FormBody(this.controller);

  @override
  FadeInDown build(BuildContext context) => FadeInDown(
    child: Container(
      height: MediaQuery.of(context).size.height * 0.47,
      
      decoration: BoxDecoration(
        color: controller.app.secondaryColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(90)),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: 10.0,
              offset: Offset(0.0, 10.0))
        ]
      ),
      child: ListView(
        padding: EdgeInsets.all(40),
        children: <Widget>[
          _EmailInput(controller),
          _PasswordInput(controller),
          _LoginButton(controller),
          _SignUpButton(controller),
        ],
      ),
    ),
  );
}

class _EmailInput extends StatelessWidget {

  final LoginController controller;
  const _EmailInput(this.controller);

  @override
  Observer build(BuildContext context) => Observer(
    builder: (_) => Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        enabled: !controller.loading,
        decoration: InputDecoration(
          icon: Icon(Icons.perm_identity,color: controller.app.backgroundColor),
          labelText: "Username",
          hintText: "example@correo.com",
          errorText: (!controller.isEmailValid && controller.email.length > 0) ? "Correo incorrecto" : null
        ),
        onChanged: controller.setEmail,
        // onTap: (controller.inputE == true) ? controller.changeImage : (){},
        // onEditingComplete: (controller.inputE == false) ? controller.changeImage : (){},
      ),
    )
  );
}

class _PasswordInput extends StatelessWidget {
  final LoginController controller;
  const _PasswordInput(this.controller);

  @override
  Observer build(BuildContext context) => Observer(
      builder: (_) => Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              obscureText: !controller.passwordVisible,
              enabled: !controller.loading,
              decoration: InputDecoration(
                  icon: Icon(Icons.enhanced_encryption,color: controller.app.backgroundColor),
                  labelText: "Password",
                  hintText: "Password",
                  errorText: (!controller.isPasswordValid &&
                          controller.password.length > 0)
                      ? "Mínimo 6 dígitos"
                      : null,
                  suffixIcon: IconButton(
                      icon: Icon((controller.passwordVisible)
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: controller.changePasswordVisibility,
                  )
              ),
              onChanged: controller.setPassword,
              // onTap: (controller.inputE == true) ? controller.changeImage : (){},
              // onEditingComplete: (controller.inputE == false) ? controller.changeImage : (){},
            ),
      )
  );
}

class _SignUpButton extends StatelessWidget {
  
  final LoginController controller;
  const _SignUpButton(this.controller);

  @override
  Row build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Don’t have an account?',style: TextStyle(fontSize: 16),textAlign: TextAlign.center,),
          FlatButton(
              child: Text('SIGN UP',
                  style: TextStyle(color: controller.app.backgroundColor,fontSize: 16)),
              onPressed: (){})
        ],
      );
}

class _LoginButton extends StatelessWidget {
  final LoginController controller;
  const _LoginButton(this.controller);

  @override
  Observer build(BuildContext context) => Observer(
      builder: (_) => AnimatedContainer(
            duration: Duration(milliseconds: 600),
            curve: Curves.fastOutSlowIn.flipped,
            margin: EdgeInsets.symmetric(
                horizontal:
                    MediaQuery.of(context).size.width * controller.buttonWitdh,
                vertical: 10.0),
            child: RaisedButton(
              disabledColor: controller.app.backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: (controller.loading)
                  ? Colors.grey
                  : controller.app.primaryColor,
              child: (controller.loading)
                  ? Container(
                      height: 20,
                      width: 20,
                      child: Center(child: CircularProgressIndicator()))
                  : Text("SIGN IN",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      overflow: TextOverflow.ellipsis),
              onPressed: controller.loginPressed,
            ),
          ));
}
