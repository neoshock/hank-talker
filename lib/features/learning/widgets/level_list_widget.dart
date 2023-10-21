import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/features/content/models/lesson_model.dart';
import 'package:hank_talker_mobile/features/content/pages/loading_screen.dart';
import 'package:hank_talker_mobile/features/content/pages/test_content_page.dart';

class LevelListWidget extends StatelessWidget {
  final List<LessonModel> lessons;
  const LevelListWidget({Key? key, required this.lessons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: lessons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 180),
      itemBuilder: (context, index) {
        return InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TestContentPage(),
                  ));
            },
            child: Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: lessons[index].isCompleted
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onSecondary,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(lessons[index].description,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onPrimary)),
                    const Spacer(),
                    Row(
                      children: [
                        Text(lessons[index].title,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary)),
                        const Spacer(),
                        Icon(
                          PhosphorIcons.play_circle_bold,
                          size: 54,
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                      ],
                    ),
                  ],
                )));
      },
    ));
  }
}
