import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorDialogWidget extends StatelessWidget {
  const ErrorDialogWidget({
    required this.title,
    required this.description,
    super.key,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.all(15),
      title: Text(
        title,
        style: Theme.of(context).textTheme.displayLarge,
      ),
      content: Stack(
        alignment: Alignment.center,
        children: [
          Lottie.asset(
            'assets/animations/animation_lnp2u5t5.json',
            repeat: false,
            height: 240,
          ),
          Positioned(
              bottom: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              )),
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
