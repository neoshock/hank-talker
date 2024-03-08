import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeSmoothPageWidget extends StatefulWidget {
  const WelcomeSmoothPageWidget({Key? key}) : super(key: key);

  @override
  _WelcomeSmoothPageWidgetState createState() =>
      _WelcomeSmoothPageWidgetState();
}

class _WelcomeSmoothPageWidgetState extends State<WelcomeSmoothPageWidget> {
  final controller = PageController();
  final List<Map<String, dynamic>> contents = [
    {
      'title': 'Bienvenido a hand talker',
      'description':
          'Descubre la belleza y la importancia de los lenguajes de señas en nuestra misión de construir puentes hacia la igualdad.',
    },
    {
      'title': 'Diversidad lingüística',
      'description':
          'Explora la diversidad lingüística que enriquece nuestras vidas y construye puentes de conexión más allá de las palabras.',
    },
    {
      'title': 'Comunicación sin barreras',
      'description':
          ' A medida que aprendes lenguajes de señas, desbloquearás nuevas formas de conectarte con personas de todo el mundo.',
    },
  ];

  List<Widget> pages = [];

  @override
  void initState() {
    pages = contents
        .map((e) => Container(
              child: Column(
                children: [
                  Text(
                    e['title'].toString(),
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Text(
                    e['description'].toString(),
                    style: TextStyle(
                        fontSize: 18,
                        //fontWeight: FontWeight.bold,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ))
        .toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.27,
          child: PageView.builder(
            controller: controller,
            // itemCount: pages.length,
            itemBuilder: (_, index) {
              return pages[index % pages.length];
            },
          ),
        ),
        SmoothPageIndicator(
          controller: controller,
          count: contents.length,
          effect: ExpandingDotsEffect(
              activeDotColor: Colors.white,
              dotColor: Colors.white.withOpacity(0.5),
              dotHeight: 9,
              dotWidth: 9,
              expansionFactor: 3,
              spacing: 6),
        ),
      ],
    );
  }
}
