import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/profile/providers/profile_provider.dart';
import 'package:hank_talker_mobile/widgets/bottom_bar.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class FinishTestPage extends StatefulWidget {
  final int totalExp;
  final int lessonId;

  const FinishTestPage(
      {Key? key, required this.totalExp, required this.lessonId})
      : super(key: key);

  @override
  _FinishTestPageState createState() => _FinishTestPageState();
}

class _FinishTestPageState extends State<FinishTestPage> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    Provider.of<ProfileProvider>(context, listen: false)
        .postLessonCompletionRecord(widget.lessonId);
    playSound('sounds/win.wav');
  }

  void playSound(String soundUrl) {
    player.play(AssetSource(soundUrl));
  }

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
                Text('Has ganado ${widget.totalExp} puntos de experiencia',
                    style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CusttomButtonRounded(context, () {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return const BottomBar();
                      }), (route) => false);
                    }, 'Volver al menú'))
              ],
            )));
  }
}
