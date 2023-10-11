import 'package:flutter/material.dart';

Widget CustomBackButton(BuildContext context, Function onPressed) {
  return Container(
    padding: EdgeInsets.all(15),
    width: 60,
    height: 60,
    margin: EdgeInsets.only(left: 20, top: 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.green,
    ),
    child: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        onPressed();
      },
    ),
  );
}
