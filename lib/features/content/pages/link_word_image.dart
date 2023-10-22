import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';

class LinkWordImage extends StatefulWidget {
  final ValueSetter<String> onCheckAnswer;

  const LinkWordImage({Key? key, required this.onCheckAnswer})
      : super(key: key);

  @override
  _LinkWordImageState createState() => _LinkWordImageState();
}

class _LinkWordImageState extends State<LinkWordImage> {
  Set<int> connectedIndices = {};
  List<List<Offset>> linesStarts = [];
  List<List<Offset>> linesEnds = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Selecciona la pareja correcta',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: CusttomButtonRounded(context, () {
                const answer = 'La respuesta es 42'; // Tu string
                widget.onCheckAnswer(answer);
              }, 'Revisar respuesta'))
        ],
      ),
    );
  }
}
