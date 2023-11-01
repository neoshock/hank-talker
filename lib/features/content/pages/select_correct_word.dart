import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/content/models/question_model.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';

class SelectCorrectWord extends StatefulWidget {
  final ValueSetter<String> onCheckAnswer;
  final QuestionModel questionModel;

  const SelectCorrectWord({Key? key, required this.onCheckAnswer, required this.questionModel})
      : super(key: key);

  @override
  _SelectCorrectWordState createState() => _SelectCorrectWordState();
}

class _SelectCorrectWordState extends State<SelectCorrectWord> {
  String? currrentWord;
  List<String> words = ['Yo', 'tú', 'él', 'ellas'];

  void selectCurrentWord() {
    setState(() {
      currrentWord = 'Uno';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Selecciona el significado correcto',
            style: Theme.of(context).textTheme.displayLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.background,
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://c4.wallpaperflare.com/wallpaper/243/475/823/life-is-strange-minimalism-vector-art-wallpaper-preview.jpg'),
                    fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).colorScheme.shadow.withOpacity(0.25),
                    blurRadius: 6,
                    offset: const Offset(0, 0),
                  )
                ]),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: words.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 70,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    currrentWord = words[index];
                  });
                },
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: words[index] == currrentWord
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.secondary,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .shadow
                            .withOpacity(0.25),
                        blurRadius: 6,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(
                      words[index],
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  ),
                ),
              );
            },
          )),
          const SizedBox(
            height: 45,
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
