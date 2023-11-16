import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/content/models/topic_model.dart';
import 'package:hank_talker_mobile/features/content/pages/test_content_page.dart';
import 'package:hank_talker_mobile/features/content/provider/content_provider.dart';
import 'package:hank_talker_mobile/features/learning/models/cateogry_detail_model.dart';
import 'package:hank_talker_mobile/features/learning/widgets/level_item_widget.dart';
import 'package:hank_talker_mobile/utils/file_type_interceptor.dart';
import 'package:provider/provider.dart';

class TopicTreeWidget extends StatefulWidget {
  final List<Topic> topics;
  const TopicTreeWidget({Key? key, required this.topics}) : super(key: key);

  @override
  _TopicTreeWidgetState createState() => _TopicTreeWidgetState();
}

class _TopicTreeWidgetState extends State<TopicTreeWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: widget.topics.length,
        itemBuilder: (context, index) {
          final topic = widget.topics[index];
          return Column(
            children: [
              Card(
                margin: const EdgeInsets.all(15),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ExpansionTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  onExpansionChanged: (value) {},
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: FileTypeInterceptor(topic.iconUrl),
                  ),
                  title: Text(topic.name),
                  subtitle: Text('${topic.pendingLessons} Pendientes'),
                  children: [
                    ChangeNotifierProvider(
                      create: (_) => ContentProvider(),
                      builder: (context, child) {
                        return FutureBuilder(
                          future: context
                              .read<ContentProvider>()
                              .getTopicDetail(widget.topics[index].id),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final topicDetail = snapshot.data as TopicModel;
                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: topicDetail.lessons.length,
                                gridDelegate:
                                    // ignore: lines_longer_than_80_chars
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 180,
                                  childAspectRatio: 1.5,
                                ),
                                itemBuilder: (context, index) {
                                  final lesson = topicDetail.lessons[index];
                                  return Card(
                                    color: lesson.isCompleted
                                        ? Theme.of(context).colorScheme.primary
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                    margin: const EdgeInsets.all(15),
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            // ignore: inference_failure_on_instance_creation
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  TestContentPage(
                                                      lessonId: lesson.id,),
                                            ),);
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
              ),
            ],
          );
        },);
  }
}
