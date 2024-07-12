import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/config/conts.dart';
import 'package:hank_talker_mobile/core/profile/providers/profile_provider.dart';
import 'package:hank_talker_mobile/features/learning/models/image_file_model.dart';
import 'package:hank_talker_mobile/features/learning/providers/learning_provider.dart';
import 'package:hank_talker_mobile/features/learning/widgets/status_info_container.dart';
import 'package:hank_talker_mobile/features/learning/widgets/topic_tree_widget.dart';
import 'package:hank_talker_mobile/widgets/bottom_bar.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';
import 'package:provider/provider.dart';

class CategoryDetailPage extends StatefulWidget {
  final int idCategory;
  const CategoryDetailPage({Key? key, required this.idCategory})
      : super(key: key);

  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  final ValueNotifier<bool> _expandInfoContainer = ValueNotifier<bool>(false);
  late ImageFile imagesBackgroundsNet = ImageFile(
      urlFile:
          'https://lh6.googleusercontent.com/proxy/imGKCfEyRg4d7inM91hzqXudmvIYyo2xNdJgadP7dFJlFxzcnsQtd8O6CUA0rJfQWwv1e-vCVty0Ofx6bBgMowBVXNM5716Lcr0jLqmLsGttgEA',
      id: 0,
      name: '');

  Future<void> getImagesBackgroundFromNet() async {
    imagesBackgroundsNet =
        await context.read<LearningProvider>().getBackground();
  }

  @override
  void initState() {
    super.initState();
    getImagesBackgroundFromNet();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LearningProvider(),
      builder: (context, child) {
        return Scaffold(
          body: SafeArea(
            top: false,
            bottom: false,
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification) {
                  final scrollPosition = notification.metrics.pixels;
                  if (scrollPosition > 200) {
                    _expandInfoContainer.value = true;
                  } else {
                    _expandInfoContainer.value = false;
                  }
                }
                return true;
              },
              child: FutureBuilder(
                future: context
                    .read<LearningProvider>()
                    .getCategoryDetail(widget.idCategory),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final categoryDetail = snapshot.data;
                    return CustomScrollView(
                      shrinkWrap: true,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.42,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          imagesBackgroundsNet.urlFile)),
                                ),
                              ),
                              CustomAppbarWidget(
                                context,
                                title: categoryDetail!.title,
                                showBackButton: true,
                                hasShadow: true,
                                onBack: () {
                                  Navigator.pushAndRemoveUntil(context,
                                      // ignore: inference_failure_on_instance_creation
                                      MaterialPageRoute(builder: (context) {
                                    return BottomBar();
                                  }), (route) => false);
                                },
                              ),
                            ],
                          ),
                        ),
                        SliverFillRemaining(
                          child: Column(
                            children: [
                              ValueListenableBuilder(
                                valueListenable: _expandInfoContainer,
                                builder: (context, value, child) {
                                  return StatusInfoContainer(
                                    totalTopics: categoryDetail.totalTopics,
                                    pendingTopics: categoryDetail.pendingTopics,
                                    paddingTop: value ? 45 : 0,
                                    totalAttempts: context
                                        .watch<ProfileProvider>()
                                        .userProfileModel
                                        .statistic
                                        .remainingLive,
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Expanded(
                                child: TopicTreeWidget(
                                  topics: categoryDetail.topics,
                                  idCategory: widget.idCategory,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error'),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
