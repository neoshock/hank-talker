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
      return; // Si no hay ninguna imagen seleccionada, no hacer nada.
    }

    setState(() {
      _selectedPairs[_selectedImage] =
          wordIndex; // Asigna o reemplaza la palabra seleccionada para la imagen.

      // Actualiza el punto de la línea para la nueva palabra si ya existe, de lo contrario, agrega un nuevo punto.
      if (_selectedImage < _points.length) {
        _points[_selectedImage] = _createOffset(wordIndex);
      } else {
        _points.add(_createOffset(wordIndex));
      }
    });
  }

  Future<void> _handleTapImage(int imageIndex) async {
    setState(() {
      if (_selectedImage == imageIndex) {
        // Si la imagen ya estaba seleccionada, deseleccionarla.
        _selectedImage = -1;
      } else {
        // Selecciona la nueva imagen.
        _selectedImage = imageIndex;
      }
    });
  }

  Offset _createOffset(int wordIndex) {
    // Calcula y devuelve un nuevo Offset basado en la palabra seleccionada.
    return Offset(
      MediaQuery.of(context).size.width * 0.3,
      wordIndex * (MediaQuery.of(context).size.height * 0.17),
    );
  }

  Future<void> checkAnswer() async {
    // Comprueba si todas las imágenes tienen una palabra asociada
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
                            width: MediaQuery.sizeOf(context).width * 0.24,
                            height: MediaQuery.sizeOf(context).height * 0.13,
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(
                                  _linkWordImageModel.images![index].valueUrl,
                                ),
                                fit: BoxFit.cover,
                              ),
                              border: _selectedImage == index
                                  ? Border.all(
                                      color: Theme.of(context).primaryColor,
                                      width: 3,
                                    )
                                  : null,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 6,
                                  offset: const Offset(0, 4),
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
                painter: LinePainter(points: _points, context: context),
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
                                _linkWordImageModel.words[index].value,
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
  LinePainter({required this.points, required this.context});
  final List<Offset> points;
  final BuildContext context;

  @override
  void paint(Canvas canvas, Size size) {
    // paint a curved line
    final paint = Paint()
      ..color = const Color(0xFFD29335)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < points.length; i++) {
      // canvas.drawLine(
      //     Offset(0, i * 120), Offset(size.width, points[i].dy), paint);
      canvas.drawPath(
        Path()
          ..moveTo(0, i * MediaQuery.of(context).size.height * 0.17)
          ..cubicTo(
            size.width * 0.3,
            i * MediaQuery.of(context).size.height * 0.17,
            size.width * 0.75,
            points[i].dy,
            size.width,
            points[i].dy,
          ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
