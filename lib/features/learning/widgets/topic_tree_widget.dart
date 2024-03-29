import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hank_talker_mobile/core/profile/providers/profile_provider.dart';
import 'package:hank_talker_mobile/features/content/models/topic_model.dart';
import 'package:hank_talker_mobile/features/content/pages/test_content_page.dart';
import 'package:hank_talker_mobile/features/content/provider/content_provider.dart';
import 'package:hank_talker_mobile/features/learning/models/cateogry_detail_model.dart';
import 'package:hank_talker_mobile/features/learning/widgets/level_item_widget.dart';
import 'package:hank_talker_mobile/utils/dialogs_events.dart';
import 'package:hank_talker_mobile/utils/file_type_interceptor.dart';
import 'package:provider/provider.dart';

class TopicTreeWidget extends StatefulWidget {
  final List<Topic> topics;
  const TopicTreeWidget({Key? key, required this.topics}) : super(key: key);

  @override
  _TopicTreeWidgetState createState() => _TopicTreeWidgetState();
}

class _TopicTreeWidgetState extends State<TopicTreeWidget> {
  final _totalExpanded = ValueNotifier<int>(0);

  Future<void> _openTestContentPage(Lesson lesson) async {
    final totalLive = Provider.of<ProfileProvider>(context, listen: false)
        .userProfileModel
        .statistic
        .remainingLive;
    if (totalLive <= 0) {
      await showErrorDialog(
          '¡Atención!',
          'No tienes más vidas disponibles, espera a que se recarguen',
          context);
      return;
    }
    if (!lesson.isCompleted && !lesson.isPending) {
      await showErrorDialog(
          '¡Atención!',
          'No puedes acceder a esta lección, primero debes completar las anteriores',
          context);
      return;
    }
    await Navigator.push(
      context,
      // ignore: inference_failure_on_instance_creation
      MaterialPageRoute(
        builder: (context) => TestContentPage(
          lessonId: lesson.id,
        ),
      ),
    );
  }

  void markFirstIncompleteLessonAsComplete(List<Lesson> lessons) {
    for (var lesson in lessons) {
      if (!lesson.isCompleted) {
        lesson.isPending = true;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: _totalExpanded.value > 1
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      child: Column(
        children: widget.topics.map((topic) {
          return Card(
            margin: const EdgeInsets.all(15),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ExpansionTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              onExpansionChanged: (value) {
                if (value) {
                  setState(() {
                    _totalExpanded.value++;
                  });
                } else {
                  setState(() {
                    _totalExpanded.value--;
                  });
                }
              },
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: FileInterceptorWidget(fileUrl: topic.iconUrl),
              ),
              title: Text(topic.name),
              subtitle: Text('${topic.pendingLessons} pendientes'),
              children: [
                ChangeNotifierProvider(
                  create: (_) => ContentProvider(),
                  builder: (context, child) {
                    return FutureBuilder(
                      future: context
                          .read<ContentProvider>()
                          .getTopicDetail(topic.id),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final topicDetail = snapshot.data as TopicModel;
                          markFirstIncompleteLessonAsComplete(
                              topicDetail.lessons);
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: topicDetail.lessons.length,
                            gridDelegate:
                                // ignore: lines_longer_than_80_chars
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 210,
                              childAspectRatio: 1.5,
                            ),
                            itemBuilder: (context, index) {
                              final lesson = topicDetail.lessons[index];
                              return Card(
                                color: lesson.isCompleted
                                    ? Theme.of(context).colorScheme.primary
                                    : lesson.isPending
                                        ? Theme.of(context)
                                            .colorScheme
                                            .secondary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                margin: const EdgeInsets.all(15),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: InkWell(
                                  onTap: () async {
                                    await _openTestContentPage(lesson);
                                  },
                                  child: LevelItemWidget(lesson: lesson),
                                ),
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
