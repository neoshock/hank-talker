import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/widgets/custom_widgets.dart';

// ignore: non_constant_identifier_names
PreferredSizeWidget CustomAppbarWidget(
  BuildContext context, {
  String? title,
  bool showBackButton = false,
  Color? textColor = Colors.black,
  List<Widget>? actions,
}) {
  return AppBar(
    toolbarHeight: 90,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    title: title != null
        ? Text(
            title!,
            style: TextStyle(
                fontSize: 21, fontWeight: FontWeight.bold, color: textColor),
          )
        : null,
    leadingWidth: 66,
    actions: actions ?? [],
    leading: showBackButton
        ? Container(
            margin: const EdgeInsets.only(left: 15),
            padding: const EdgeInsets.symmetric(vertical: 21),
            child: CustomBackButton(context, () {
              Navigator.pop(context);
            }),
          )
        : null,
    centerTitle: true,
  );
}
