import 'package:cached_network_image/cached_network_image.dart';
import 'package:desarrollo_app_prueba/app/models/userModel.dart';
import 'package:desarrollo_app_prueba/app/widgets/customCircularProgressIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {

  @override
  Scaffold build(BuildContext context) => Scaffold(
    backgroundColor: controller.app.secondaryColor,
     appBar: MyCustomAppBar(90, controller),
    body: RefreshIndicator(
      onRefresh: controller.getAlData,
      child: ListView(
        children: <Widget>[
          _UsersWidget(controller)
        ],
      ),
    ),
  );
}

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final HomeController controller;
  const MyCustomAppBar(this.height, this.controller);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 100.0,
            decoration: BoxDecoration(
        color: controller.app.secondaryColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 2.0))
        ]
      ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.05,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: _botones(),            
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
  
 @override
  Size get preferredSize => Size.fromHeight(height);
}

Widget _botones(){

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      _botonHome(Icons.home, 'HOME'),
      _botonDisable(Icons.chat),
      _botonDisable(Icons.favorite_border),
      _botonDisable(Icons.person),
    ],
  );
}

Widget _botonHome(IconData icon, String titulo){

  return Column(
    children: <Widget>[
      RaisedButton.icon(
        onPressed: null, 
        icon: Icon(icon, size: 30,color: Color(0xff1A1A1A),), 
        label: Text(titulo,style: TextStyle(fontSize: 13,color: Color(0xff1A1A1A)),),
        disabledColor: Color(0xffFEDD7C),
        shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
      )
    ]
  );
}

Widget _botonDisable(IconData icon){
  return Column(
    children: <Widget>[
      RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              disabledColor: Colors.white,
              colorBrightness: Brightness.light,
              child:Icon(icon, size: 30),
              onPressed: (){},
            ),
    ],
  );
}

class _UsersWidget extends StatelessWidget {
  
  final HomeController controller;
  const _UsersWidget(this.controller);

  @override
  Observer build(BuildContext context) => Observer(
    builder: (_) {
      
      if(controller.user == null) return CustomCircularProgressIndicator();

      if(controller.user.length == 0) return Container();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: ListTile(
              title: Text('CONTACTOS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left:20,right:20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    controller.user.length,
                    (i) => _UserItem(controller, controller.user[i])
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  );
}

class _UserItem extends StatelessWidget {

  final HomeController controller;
  final User user;
  const _UserItem(this.controller, this.user);

  @override
  Container build(BuildContext context) => Container(
    padding: EdgeInsets.fromLTRB(10,10,10,20),
    height: MediaQuery.of(context).size.height * 0.15,
    child: Container(
      decoration: BoxDecoration(
        color: controller.app.backgroundColor.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 4,
        blurRadius: 4,
        offset: Offset(0, 1.5), // changes position of shadow
      ),
    ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                child: CachedNetworkImage(
                  imageUrl: user.avatar,
                  placeholder: (context, url) => Image(
                    image: AssetImage("assets/loading.gif"),
                    height: 150.0,
                    width: 110.0,
                    fit: BoxFit.cover
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  height: 150.0,
                  width:  110.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('${user.firstName}',style: TextStyle(color: controller.app.primaryColor)),
                  SizedBox(height: 5.0),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: '${user.lastName} ', style: TextStyle(color: controller.app.primaryColor,fontSize: 13)),
                      ]
                    )
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.chevron_right),
            iconSize: 45,
            color: controller.app.backgroundColor,
            onPressed: () {}
          )
        ],
      ),
    ),
  );
}