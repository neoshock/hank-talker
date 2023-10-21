import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';

class CorrectSentence extends StatefulWidget {
  final ValueSetter<String> onCheckAnswer;

  const CorrectSentence({Key? key, required this.onCheckAnswer})
      : super(key: key);

  @override
  _CorrectSentenceState createState() => _CorrectSentenceState();
}

class _CorrectSentenceState extends State<CorrectSentence> {
  List<Map<String, TextEditingController>> textControllers = [];
  List<String> words = [
    'Yo',
    'tú',
    'él',
    'ella',
    'nosotros',
    'vosotros',
    'ellos',
    'ellas'
  ];
  List<String> selectedWords = [];

  void _addToSentence(String word) {
    if (!selectedWords.contains(word)) {
      setState(() {
        selectedWords.add(word);
      });
      List.generate(selectedWords.length, (index) {
        textControllers[index]['text_$index']!.text = selectedWords[index];
      });
    }
  }

  void _removeWordToSentence(String word) {
    if (selectedWords.contains(word)) {
      setState(() {
        selectedWords.remove(word);
      });
      List.generate(textControllers.length, (index) {
        // validate if the word not contain in selectedWords
        if (textControllers[index]['text_$index']!.text == word) {
          textControllers[index]['text_$index']!.text = '';
        }
      });
    }
  }

  void _clearSentence() {
    setState(() {
      selectedWords.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    List.generate(words.length, (index) {
      textControllers.add({'text_$index': TextEditingController()});
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
            'Arma la oración correcta',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 45,
          ),
          Container(
              width: MediaQuery.sizeOf(context).width,
              height: 180,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.background,
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .shadow
                          .withOpacity(0.25),
                      blurRadius: 6,
                      offset: const Offset(0, 0),
                    )
                  ]),
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 90,
                      onPressed: () {},
                      icon: const Icon(
                        PhosphorIcons.play_circle,
                      ))
                ],
              )),
          const SizedBox(
            height: 15,
          ),
          Wrap(
              spacing: 6,
              runSpacing: 15,
              children: List.generate(words.length, (index) {
                return SizedBox(
                    width: (words[index].length + 15) * 6,
                    child: TextFormField(
                      readOnly: true,
                      controller: textControllers[index]['text_$index'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(),
                    ));
              })),
          const SizedBox(
            height: 30,
          ),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: words.map((word) {
              return InkWell(
                  onTap: () {
                    if (selectedWords.contains(word)) {
                      _removeWordToSentence(word);
                    } else {
                      _addToSentence(word);
                    }
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selectedWords.contains(word)
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.secondary,
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .colorScheme
                                  .shadow
                                  .withOpacity(0.25),
                              blurRadius: 6,
                              offset: const Offset(0, 0),
                            )
                          ]),
                      width: (word.length.toDouble() + 15) * 5,
                      child: Text(
                        word,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      )));
            }).toList(),
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
