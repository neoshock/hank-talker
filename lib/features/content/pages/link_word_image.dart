import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/content/models/lesson_model.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';

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

  final List<Offset> _points = [];
  int _selectedImage = -1;
  final Map<int, int> _selectedPairs = {};

  Future<void> _handleTapWord(int wordIndex) async {
    if (_selectedImage == -1) {
      return;
    }

    int? previousImageIndex;
    _selectedPairs.forEach((key, value) {
      if (value == wordIndex) {
        previousImageIndex = key;
      }
    });

    setState(() {
      if (previousImageIndex != null &&
          previousImageIndex! >= 0 &&
          previousImageIndex! < _points.length) {
        _selectedPairs.remove(previousImageIndex);
        _points[previousImageIndex!] = const Offset(-1, -1);
      } else {}

      _selectedPairs[_selectedImage] = wordIndex;

      if (_selectedImage < _points.length) {
        _points[_selectedImage] = _createOffset(_selectedImage, _selectedPairs);
      } else {
        _points.add(_createOffset(_selectedImage, _selectedPairs));
      }
    });
  }

  Future<void> _handleTapImage(int imageIndex) async {
    setState(() {
      if (_selectedImage == imageIndex) {
        _selectedImage = -1;
      } else {
        _selectedImage = imageIndex;
      }
    });
  }

  Offset _createOffset(int imageIndex, Map<int, int> selectedPairs) {
    int wordIndex = selectedPairs[imageIndex] ?? -1;
    print(wordIndex);
    print(selectedPairs);
    print(imageIndex);
    if (wordIndex < 0) {
      return const Offset(-1, -1);
    }

    return Offset(
      MediaQuery.of(context).size.width * 0.3,
      wordIndex * (MediaQuery.of(context).size.height * 0.17),
    );
  }

  Future<void> checkAnswer() async {
    if (_selectedPairs.length != _linkWordImageModel.images!.length) {
      return;
    }

    var allPairsCorrect = true;

    _selectedPairs.forEach((imageIndex, wordIndex) {
      // Compara el valor de la imagen y la palabra seleccionada
      if (_linkWordImageModel.images![imageIndex].value !=
          _linkWordImageModel.words[wordIndex].value) {
        allPairsCorrect = false;
      }
    });

    widget.onCheckAnswer(allPairsCorrect);

    // Opcional: resetear las selecciones después de la verificación
    setState(_selectedPairs.clear);
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
                              image: DecorationImage(
                                image: NetworkImage(
                                  _linkWordImageModel.images![index].valueUrl,
                                ),
                                fit: BoxFit.contain,
                              ),
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
                            width: MediaQuery.sizeOf(context).width * 0.24,
                            height: MediaQuery.sizeOf(context).height * 0.13,
                            margin: const EdgeInsets.all(15),
                            child: Center(
                              child: Text(
                                _linkWordImageModel.words[index].name!,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium,
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
    // paint a curved line
    final paint = Paint()
      ..color = const Color(0xFFD29335)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    selectedPairs.forEach((imageIndex, wordIndex) {
      if (wordIndex >= 0) {
        // Calcula el 'Offset' para la imagen y la palabra
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
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  bool listsDiffer(List<Offset> a, List<Offset> b) {
    if (a.length != b.length) return true;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return true;
    }
    return false;
  }
}
