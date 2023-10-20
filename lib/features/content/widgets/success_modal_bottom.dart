import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';

class SuccessModalBottom extends StatelessWidget {
  final VoidCallback onSuccess;
  const SuccessModalBottom({Key? key, required this.onSuccess})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color.fromARGB(255, 188, 225, 178)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Felicidades!',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          SizedBox(height: 15),
          Text(
            'Respuesta correcta',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          SizedBox(height: 30),
          SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: CusttomButtonRounded(context, () {
                Navigator.of(context).pop();
                onSuccess();
              }, 'Siguiente Pregunta')),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
