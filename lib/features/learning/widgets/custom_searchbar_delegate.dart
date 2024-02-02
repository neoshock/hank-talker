import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/learning/widgets/custom_find_input_widget.dart';
import 'package:hank_talker_mobile/features/learning/widgets/learning_header.dart';

class CustomSearchBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 120.0; // Altura mínima del header persistente

  @override
  double get maxExtent => 240.0; // Altura máxima del header persistente

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.4,
        ),
        const LearningHeader(),
        const Positioned(
          bottom: 0,
          child: CustomFindInputWidget(),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
