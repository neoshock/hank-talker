import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccesDialogWidget extends StatefulWidget {
  const SuccesDialogWidget({
    required this.title,
    required this.description,
    super.key,
  });
  final String title;
  final String description;

  @override
  _SuccesDialogWidgetState createState() => _SuccesDialogWidgetState();
}

class _SuccesDialogWidgetState extends State<SuccesDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: EdgeInsets.zero,
      actionsPadding: const EdgeInsets.all(15),
      title: Text(
        widget.title,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('assets/animations/animation_lnp29s7h.json',
              repeat: false),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Text(
              widget.description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Aceptar',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
