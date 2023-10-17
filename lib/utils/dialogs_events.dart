import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/widgets/error_dialog_widget.dart';
import 'package:hank_talker_mobile/widgets/succes_dialog_widget.dart';

Future<void> showSuccessDialog(
    String title, String description, BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return SuccesDialogWidget(
        title: title,
        description: description,
      );
    },
  );
}

Future<void> showErrorDialog(
    String title, String description, BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return ErrorDialogWidget(
        title: title,
        description: description,
      );
    },
  );
}
