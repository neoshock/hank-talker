import 'package:flutter/material.dart';

Widget CustomBackButton(BuildContext context, Function onPressed) {
  return Container(
      width: 45,
      height: 45,
      padding: EdgeInsets.only(left: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: IconButton(
        alignment: Alignment.center,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          padding:
              MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          onPressed();
        },
      ));
}
