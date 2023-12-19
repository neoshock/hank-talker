import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/content/models/lesson_model.dart';
import 'package:hank_talker_mobile/utils/file_type_interceptor.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';

class SelectCorrectImage extends StatefulWidget {
  const SelectCorrectImage({
    required this.onCheckAnswer,
    required this.questionModel,
    super.key,
  });

  final ValueSetter<bool> onCheckAnswer;
  final Question questionModel;

  @override
  _SelectCorrectImageState createState() => _SelectCorrectImageState();
}

class _SelectCorrectImageState extends State<SelectCorrectImage> {
  final List<ContentElement> contents = [];
  int? currentImage;
  late final contentResponse = widget.questionModel.content as List;

  Future<void> checkAnswer() async {
    // validate if image is selected
    if (currentImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecciona una imagen'),
        ),
      );
      return;
    }
    widget.onCheckAnswer(
      contents[currentImage!].value == widget.questionModel.answer,
    );
  }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < contentResponse.length; i++) {
      contents.add(
        ContentElement.fromJson(contentResponse[i] as Map<String, dynamic>),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Selecciona la imagen correcta',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 45,
          ),
          Text(
            widget.questionModel.title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(
            height: 45,
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: contents.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      currentImage = index;
                    });
                  },
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .shadow
                              .withOpacity(0.25),
                          blurRadius: 6,
                        ),
                      ],
                      color: currentImage == index
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: FileInterceptorWidget(
                      fileUrl: contents[index].valueUrl,
                    ),
                  ),
                );
              },
            ),
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
