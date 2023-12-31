import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/content/models/lesson_model.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';

class SelectCorrectWord extends StatefulWidget {
  const SelectCorrectWord({
    required this.onCheckAnswer,
    required this.questionModel,
    super.key,
  });
  final ValueSetter<bool> onCheckAnswer;
  final Question questionModel;

  @override
  _SelectCorrectWordState createState() => _SelectCorrectWordState();
}

class _SelectCorrectWordState extends State<SelectCorrectWord> {
  String? currrentWord;
  late final PurpleContent content;

  Future<void> checkAnswer() async {
    // validate if current word is null
    if (currrentWord == null) {
      return;
    }
    widget.onCheckAnswer(currrentWord == widget.questionModel.answer);
  }

  @override
  void initState() {
    super.initState();
    content = PurpleContent.fromJson(
      widget.questionModel.content as Map<String, dynamic>,
    );
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
              image: DecorationImage(
                image: NetworkImage(content.valueUrl!),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withOpacity(0.25),
                  blurRadius: 6,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: content.words.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 70,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      currrentWord = content.words[index].value;
                    });
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: content.words[index].value == currrentWord
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
                    child: Center(
                      child: Text(
                        content.words[index].name!,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: CusttomButtonRounded(
              context,
              checkAnswer,
              'Revisar respuesta',
            ),
          ),
        ],
      ),
    );
  }
}
