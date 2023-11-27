// ignore_for_file: avoid_dynamic_calls, collection_methods_unrelated_type

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/features/content/models/lesson_model.dart';
import 'package:hank_talker_mobile/utils/file_type_interceptor.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';

class CorrectSentence extends StatefulWidget {
  final ValueSetter<bool> onCheckAnswer;
  final Question questionModel;

  const CorrectSentence({
    Key? key,
    required this.onCheckAnswer,
    required this.questionModel,
  }) : super(key: key);

  @override
  _CorrectSentenceState createState() => _CorrectSentenceState();
}

class _CorrectSentenceState extends State<CorrectSentence> {
  List<Map<String, TextEditingController>> textControllers = [];
  List<Word> words = [];
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
    print(widget.questionModel.answer);
    final content = widget.questionModel.content['words'] as List;
    words =
        content.map((e) => Word.fromJson(e as Map<String, dynamic>)).toList();
    List.generate(words.length, (index) {
      textControllers.add({'text_$index': TextEditingController()});
    });
  }

  Future<void> checkAnswer() async {
    if (selectedWords.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Debes armar la oración'),
          backgroundColor: Theme.of(context).colorScheme.error,
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: 'Ok',
            onPressed: () {},
          ),
        ),
      );
      return;
    }
    final wordComplete = textControllers.map((e) => e.values.first.text);
    widget.onCheckAnswer(wordComplete.join(' ') ==
        widget.questionModel.content['answer'].toString());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            height: 150,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.background,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withOpacity(0.25),
                  blurRadius: 6,
                ),
              ],
            ),
            child: FileInterceptorWidget(
              fileUrl: widget.questionModel.content['valueUrl'].toString(),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: List.generate(words.length, (index) {
              return SizedBox(
                width: (words[index].name!.length + 15) * 6,
                child: TextFormField(
                  readOnly: true,
                  controller: textControllers[index]['text_$index'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(
            height: 30,
          ),
          Wrap(
            spacing: 15,
            runSpacing: 6,
            children: words.map((word) {
              return InkWell(
                onTap: () {
                  if (selectedWords.contains(word.name!)) {
                    _removeWordToSentence(word.name!);
                  } else {
                    _addToSentence(word.name!);
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
                      ),
                    ],
                  ),
                  width: (word.name!.length.toDouble() + 15) * 5,
                  child: Text(
                    word.name!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child:
                CusttomButtonRounded(context, checkAnswer, 'Revisar respuesta'),
          ),
        ],
      ),
    );
  }
}
