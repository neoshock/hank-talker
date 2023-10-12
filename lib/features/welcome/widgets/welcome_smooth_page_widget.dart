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
      'title': 'Bienvenido a Hank Talker',
      'description':
          'Hank Talker es una aplicación que te ayudará a comunicarte con tus seres queridos 1.',
    },
    {
      'title': 'Bienvenido a Hank Talker',
      'description':
          'Hank Talker es una aplicación que te ayudará a comunicarte con tus seres queridos 2.',
    },
    {
      'title': 'Bienvenido a Hank Talker',
      'description':
          'Hank Talker es una aplicación que te ayudará a comunicarte con tus seres queridos 3.',
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
          height: MediaQuery.sizeOf(context).height * 0.2,
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
