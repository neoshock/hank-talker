import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/content/models/link_word_image_model.dart';
import 'package:hank_talker_mobile/features/content/models/question_model.dart';
import 'package:hank_talker_mobile/widgets/buttons.dart';

class LinkWordImage extends StatefulWidget {
  final QuestionModel questionModel;
  final ValueSetter<String> onCheckAnswer;

  const LinkWordImage(
      {Key? key, required this.onCheckAnswer, required this.questionModel})
      : super(key: key);

  @override
  _LinkWordImageState createState() => _LinkWordImageState();
}

class _LinkWordImageState extends State<LinkWordImage> {
  late final LinkWordImageModel _linkWordImageModel =
      widget.questionModel.content as LinkWordImageModel;
  List<Offset> _points = [];
  int _selectedImage = -1;

  Future<void> _handleTapWord(int index) async {
    if (_selectedImage == -1) {
      return;
    }
    setState(() {
      // validate if point has drawer
      if (_points.length > _selectedImage) {
        _points[_selectedImage] = Offset(0, index * 150);
        return;
      }
      _points.add(Offset(MediaQuery.sizeOf(context).width * 0.24, 0));
      _points[_selectedImage] = Offset(0, index * 150);
    });
  }

  Future<void> _handleTapImage(int index) async {
    setState(() {
      _selectedImage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _points = List.generate(_linkWordImageModel.images.length, (index) {
      return Offset(0, index * 150);
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
            'Selecciona la pareja correcta',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    List.generate(_linkWordImageModel.images.length, (index) {
                  return Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      const SizedBox(
                        width: 120,
                        height: 120,
                      ),
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                  _linkWordImageModel.images[index].imageUrl),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 6,
                                offset: Offset(0, 4),
                              )
                            ]),
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
                              height: 15,
                              margin: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: _selectedImage == index
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context)
                                          .secondaryHeaderColor
                                          .withOpacity(0.75),
                                  shape: BoxShape.circle),
                            ),
                          ))
                    ],
                  );
                }),
              ),
              CustomPaint(
                size: Size(MediaQuery.sizeOf(context).width * 0.24,
                    MediaQuery.sizeOf(context).height * 0.53),
                painter: LinePainter(points: _points),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    List.generate(_linkWordImageModel.words.length, (index) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        width: 120,
                        height: 90,
                        margin: const EdgeInsets.all(15),
                        child: Center(
                          child: Text(
                            _linkWordImageModel.words[index].word,
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
                              height: 15,
                              margin: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .secondaryHeaderColor
                                      .withOpacity(0.75),
                                  shape: BoxShape.circle),
                            ),
                          ))
                    ],
                  );
                }),
              )
            ],
          )),
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

class LinePainter extends CustomPainter {
  final List<Offset> points;

  LinePainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    // paint a curved line
    final paint = Paint()
      ..color = Color(0xFFD29335)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..strokeCap = StrokeCap.round;

    for (var i = 0; i < points.length; i++) {
      // canvas.drawLine(
      //     Offset(0, i * 120), Offset(size.width, points[i].dy), paint);
      canvas.drawPath(
          Path()
            ..moveTo(0, i * 150)
            ..cubicTo(size.width * 0.25, i * 150, size.width * 0.75,
                points[i].dy, size.width, points[i].dy),
          paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
