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

  Future<void> _handleTapWord(int index) async {
    if (_selectedImage == -1) {
      return;
    }
    setState(() {
      // validate if point has drawer
      if (_selectedImage < _points.length) {
        _points[_selectedImage] = Offset(
          MediaQuery.sizeOf(context).width * 0.3,
          index * (MediaQuery.sizeOf(context).height * 0.13),
        );
        return;
      }
      if (_selectedImage > _points.length) {
        return;
      }
      if (_points.length == _linkWordImageModel.images!.length) {
        return;
      }
      _points.add(
        Offset(
          MediaQuery.sizeOf(context).width * 0.3,
          index * (MediaQuery.sizeOf(context).height * 0.13),
        ),
      );
    });
  }

  Future<void> _handleTapImage(int index) async {
    setState(() {
      _selectedImage = index;
    });
  }

  Future<void> checkAnswer() async {
    // first validate if all points has been drawn
    if (_points.length != _linkWordImageModel.images!.length) {
      return;
    }

    var allLinesCorrect = true;

    for (var i = 0; i < _points.length; i++) {
      final expectedX = MediaQuery.sizeOf(context).width * 0.3;
      final expectedY = i * (MediaQuery.sizeOf(context).height * 0.13);

      // Validar si las coordenadas del punto coinciden con las esperadas
      if (_points[i].dx != expectedX || _points[i].dy != expectedY) {
        allLinesCorrect = false;
        break;
      }
    }
    widget.onCheckAnswer(allLinesCorrect);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    List.generate(_linkWordImageModel.images!.length, (index) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 90,
                        height: 90,
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(
                              _linkWordImageModel.images![index].valueUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 6,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: InkWell(
                          onTap: () {
                            _handleTapImage(index);
                          },
                          borderRadius: BorderRadius.circular(100),
                          splashFactory: InkRipple.splashFactory,
                          child: Container(
                            width: 15,
                            height: 90,
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(100),
                                bottomRight: Radius.circular(100),
                              ),
                              color: _selectedImage == index
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context)
                                      .secondaryHeaderColor
                                      .withOpacity(0.75),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
              CustomPaint(
                isComplex: true,
                willChange: true,
                size: Size(
                  MediaQuery.sizeOf(context).width * 0.25,
                  // calculate the height of the canvas with the number of items
                  MediaQuery.sizeOf(context).height *
                      (0.1 * _linkWordImageModel.words.length),
                ),
                painter: LinePainter(points: _points, context: context),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    List.generate(_linkWordImageModel.words.length, (index) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: 120,
                        height: 90,
                        margin: const EdgeInsets.all(15),
                        child: Center(
                          child: Text(
                            _linkWordImageModel.words[index].value,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: InkWell(
                          onTap: () {
                            _handleTapWord(index);
                          },
                          borderRadius: BorderRadius.circular(100),
                          splashFactory: InkRipple.splashFactory,
                          child: Container(
                            width: 15,
                            height: 45,
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .secondaryHeaderColor
                                  .withOpacity(0.75),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
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
          ..moveTo(0, i * MediaQuery.of(context).size.height * 0.13)
          ..cubicTo(
            size.width * 0.3,
            i * MediaQuery.of(context).size.height * 0.13,
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
