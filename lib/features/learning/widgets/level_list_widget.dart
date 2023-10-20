import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/features/content/pages/loading_screen.dart';
import 'package:hank_talker_mobile/features/content/pages/test_content_page.dart';

class LevelListWidget extends StatelessWidget {
  const LevelListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
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
                    color: Theme.of(context).colorScheme.primary),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Abecedario',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                                color:
                                    Theme.of(context).colorScheme.onPrimary)),
                    const Spacer(),
                    Row(
                      children: [
                        Text('Nivel 1',
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
                    const Spacer(),
                    Text(
                      'Preguntas 3/12',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    )
                  ],
                )));
      },
    ));
  }
}
