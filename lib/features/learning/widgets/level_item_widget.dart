import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/content/models/topic_model.dart';
import 'package:hank_talker_mobile/utils/file_type_interceptor.dart';

class LevelItemWidget extends StatelessWidget {
  final Lesson lesson;
  const LevelItemWidget({Key? key, required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: FileInterceptorWidget(fileUrl: lesson.iconUrl),
              ),
              const SizedBox(
                width: 6,
              ),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text('${lesson.totalExperience} EXP',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.white)),
              )
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Expanded(
            child: Text(
              lesson.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Expanded(
            child: Text(
              lesson.description,
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
