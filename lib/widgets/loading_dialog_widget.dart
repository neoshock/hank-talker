import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingDialogWidget extends StatefulWidget {
  final String title = 'Cargando';
  final String description = 'Por favor, espere un momento';
  const LoadingDialogWidget({Key? key}) : super(key: key);

  @override
  _LoadingDialogWidgetState createState() => _LoadingDialogWidgetState();
}

class _LoadingDialogWidgetState extends State<LoadingDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: EdgeInsets.zero,
      actionsPadding: const EdgeInsets.all(15),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('assets/animations/animation_lny45v3q.json', width: 150),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Text(widget.description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.grey,
                    )),
          ),
          SizedBox(height: 15)
        ],
      ),
    );
  }
}
