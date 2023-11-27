import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/widgets/bottom_bar.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:lottie/lottie.dart';

class FailedPage extends StatelessWidget {
  final String title;
  final String description;
  const FailedPage({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,
                    style: Theme.of(context).textTheme.displayLarge,
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 30,
                ),
                LottieBuilder.asset(
                    'assets/animations/Animation - 1701050166335.json'),
                const SizedBox(
                  height: 30,
                ),
                Text(description,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: CusttomButtonRounded(context, () {
                    Navigator.of(context).pushAndRemoveUntil(
                        // ignore: inference_failure_on_instance_creation
                        MaterialPageRoute(
                            builder: (context) => const BottomBar()),
                        (route) => false);
                  }, 'Regresar al inicio'),
                ),
              ],
            )));
  }
}
