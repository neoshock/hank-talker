import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/features/learning/widgets/level_list_widget.dart';
import 'package:hank_talker_mobile/features/learning/widgets/status_info_container.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';

class CategoryDetailPage extends StatefulWidget {
  const CategoryDetailPage({Key? key}) : super(key: key);

  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  final ValueNotifier<bool> _expandInfoContainer = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
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
            child: CustomScrollView(
              shrinkWrap: true,
              slivers: [
                SliverToBoxAdapter(
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 0.42,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/images/Rectangle 68.png',
                            ),
                          ),
                        ),
                      ),
                      CustomAppbarWidget(
                        context,
                        title: 'Hola',
                        showBackButton: true,
                        actions: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 18,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.25),
                                  spreadRadius: 3,
                                  blurRadius: 6,
                                  offset: const Offset(
                                    0,
                                    3,
                                  ), // changes position of shadow
                                ),
                              ],
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            child: IconButton(
                              iconSize: 24,
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              icon: const Icon(
                                PhosphorIcons.book_bookmark_bold,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
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
                            paddingTop:
                                value ? MediaQuery.of(context).padding.top : 0,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const LevelListWidget()
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
