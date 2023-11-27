import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/features/content/models/lesson_model.dart';

class StatusInfoContainer extends StatelessWidget {
  final int totalTopics;
  final int pendingTopics;
  final int totalAttempts;
  final double paddingTop;
  const StatusInfoContainer(
      {Key? key,
      required this.paddingTop,
      required this.totalTopics,
      required this.pendingTopics,
      required this.totalAttempts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 6 + paddingTop,
        bottom: 15,
      ),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                PhosphorIcons.game_controller,
                size: 45,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                '$pendingTopics/$totalTopics Temas',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              )
            ],
          ),
          Container(
            width: 1,
            height: 60,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 45,
                width: 45,
                padding: EdgeInsets.all(6),
                child: CircularProgressIndicator(
                  // validate if division by zero
                  value: totalTopics == 0
                      ? 0
                      : pendingTopics / totalTopics.toDouble(),
                  strokeWidth: 9,
                  strokeCap: StrokeCap.round,
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                'Progreso',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              )
            ],
          ),
          Container(
            width: 1,
            height: 60,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                PhosphorIcons.heart_fill,
                size: 45,
                color: Theme.of(context).colorScheme.errorContainer,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                '$totalAttempts/5 Intentos',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              )
            ],
          ),
        ],
      ),
    );
  }
}
