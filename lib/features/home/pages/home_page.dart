import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/home/widgets/body_section.dart';
import 'package:hank_talker_mobile/features/home/widgets/header_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: use_colored_box
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: const SafeArea(
          bottom: false,
          child: Column(
            children: [
              HeaderSection(),
              SizedBox(
                height: 15,
              ),
              BodySection()
            ],
          )),
    );
  }
}
