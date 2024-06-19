import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/content/models/lesson_model.dart';
import 'package:hank_talker_mobile/utils/dialogs_events.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';
import 'package:collection/collection.dart';
import 'package:hank_talker_mobile/widgets/video_player_widget.dart';

class LinkWordImage extends StatefulWidget {
  const LinkWordImage({
    required this.onCheckAnswer,
    required this.questionModel,
    super.key,
  });
  final Question questionModel;
  final ValueSetter<bool> onCheckAnswer;

  @override
  _LinkWordImageState createState() => _LinkWordImageState();
}

class _LinkWordImageState extends State<LinkWordImage> {
  late final PurpleContent _linkWordImageModel = PurpleContent.fromJson(
    widget.questionModel.content as Map<String, dynamic>,
  );

  int _selectedImage = -1;
  final Map<int, int> _selectedPairs = {};

  Future<void> _handleTapWord(int wordIndex) async {
    if (_selectedImage == -1) {
      return;
    }

    setState(() {
      final existingImageIndex = _selectedPairs.entries
          .firstWhereOrNull((entry) => entry.value == wordIndex)
          ?.key;

      if (existingImageIndex != null) {
        _selectedPairs.remove(existingImageIndex);
      }

      _selectedPairs[_selectedImage] = wordIndex;
    });
  }

  Future<void> _handleTapImage(int imageIndex) async {
    setState(() {
      _selectedImage = (_selectedImage == imageIndex) ? -1 : imageIndex;
    });
  }

  Future<void> checkAnswer() async {
    if (_selectedPairs.length != _linkWordImageModel.images!.length) {
      // show error message scaffold
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debes seleccionar todas las parejas'),
        ),
      );
      return;
    }

    var allPairsCorrect = true;

    _selectedPairs.forEach((imageIndex, wordIndex) {
      if (_linkWordImageModel.images![imageIndex].value !=
          _linkWordImageModel.words[wordIndex].value) {
        allPairsCorrect = false;
      }
    });

    widget.onCheckAnswer(allPairsCorrect);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height *
                    (0.18 * _linkWordImageModel.words.length),
              ),
              Positioned(
                left: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(_linkWordImageModel.images!.length,
                      (index) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _handleTapImage(index);
                          },
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.27,
                            height: MediaQuery.sizeOf(context).height * 0.13,
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: _selectedImage == index
                                  ? Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 3,
                                    )
                                  : null,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: VideoPlayerWidget(
                              url: _linkWordImageModel.images![index].valueUrl,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              CustomPaint(
                isComplex: true,
                willChange: true,
                size: Size(
                  MediaQuery.sizeOf(context).width * 0.36,
                  // calculate the height of the canvas with the number of items
                  MediaQuery.sizeOf(context).height *
                      (0.14 * _linkWordImageModel.words.length),
                ),
                painter: LinePainter(
                  selectedPairs: _selectedPairs,
                  context: context,
                ),
              ),
              Positioned(
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      List.generate(_linkWordImageModel.words.length, (index) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _handleTapWord(index);
                          },
                          borderRadius: BorderRadius.circular(15),
                          splashFactory: InkRipple.splashFactory,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 1,
                              ),
                            ),
                            width: MediaQuery.sizeOf(context).width * 0.27,
                            height: MediaQuery.sizeOf(context).height * 0.13,
                            margin: const EdgeInsets.all(15),
                            child: Center(
                              child: Text(
                                _linkWordImageModel.words[index].name!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
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

class LinePainter extends CustomPainter {
  LinePainter({required this.selectedPairs, required this.context});
  final Map<int, int> selectedPairs;
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD29335)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    selectedPairs.forEach((imageIndex, wordIndex) {
      if (wordIndex >= 0) {
        double imageY = imageIndex * MediaQuery.of(context).size.height * 0.17;
        double wordY = wordIndex * MediaQuery.of(context).size.height * 0.17;

        canvas.drawPath(
          Path()
            ..moveTo(0, imageY)
            ..cubicTo(
              size.width * 0.3,
              imageY,
              size.width * 0.75,
              wordY,
              size.width,
              wordY,
            ),
          paint,
        );
      }
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
