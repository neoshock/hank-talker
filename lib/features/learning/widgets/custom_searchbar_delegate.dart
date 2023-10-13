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
    // Construye el widget del header persistente
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.4,
        ),
        const LearningHeader(), // Tu widget de encabezado
        const Positioned(
          bottom:
              0, // Ajusta la posición del campo de búsqueda según tus necesidades
          child: CustomFindInputWidget(), // Tu widget de campo de búsqueda
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
