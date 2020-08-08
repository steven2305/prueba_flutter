import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {

  final Color color;
  const CustomCircularProgressIndicator({this.color = Colors.white});

  @override
  Container build(BuildContext context) => Container(
    padding: EdgeInsets.all(20),
    height: 35,
    width: 35,
    child: Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color),
      )
    )
  );
}