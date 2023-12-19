import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:lottie/lottie.dart';

class FinishTestPage extends StatelessWidget {
  final int totalExp;
  const FinishTestPage({Key? key, required this.totalExp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                LottieBuilder.asset(
                  'assets/animations/animation_lny4wrwm.json',
                  repeat: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text('Has completado el test',
                    style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(
                  height: 30,
                ),
                Text('Has ganado $totalExp puntos de experiencia',
                    style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: CusttomButtonRounded(context, () {
                      Navigator.of(context).pop();
                    }, 'Volver al menú'))
              ],
            )));
  }
}
