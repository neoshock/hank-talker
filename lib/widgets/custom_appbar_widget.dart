import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/widgets/custom_widgets.dart';

// ignore: non_constant_identifier_names
PreferredSizeWidget CustomAppbarWidget(
  BuildContext context, {
  String? title,
  bool showBackButton = false,
  Color? textColor = Colors.black,
  List<Widget>? actions,
  bool hasShadow = false,
  Function()? onBack,
}) {
  return AppBar(
    toolbarHeight: 90,
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    title: title != null
        ? Container(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
            decoration: BoxDecoration(
              color: hasShadow
                  ? Colors.white.withOpacity(0.75)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              boxShadow: hasShadow
                  ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      )
                    ]
                  : null,
            ),
            child: Text(
              title!,
              style: TextStyle(
                  fontSize: 21, fontWeight: FontWeight.bold, color: textColor),
            ))
        : null,
    leadingWidth: 66,
    actions: actions ?? [],
    leading: showBackButton
        ? Container(
            margin: const EdgeInsets.only(left: 15),
            padding: const EdgeInsets.symmetric(vertical: 21),
            child: CustomBackButton(context, () {
              if (onBack != null) {
                onBack();
              } else
                Navigator.pop(context);
            }),
          )
        : null,
    centerTitle: true,
  );
}
