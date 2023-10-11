import 'dart:ffi';

import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/config/main_pages.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  PageController pageController = PageController();

  List<TabItem> items = [
    const TabItem(
      icon: PhosphorIcons.house_bold,
      title: 'Inicio',
    ),
    const TabItem(
      icon: PhosphorIcons.book_open_bold,
      title: 'Cart',
    ),
    const TabItem(
      icon: PhosphorIcons.user_bold,
      title: 'Perfil',
    ),
  ];

  @override
  void initState() {
    pageController = PageController(initialPage: currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: mainPages),
        bottomNavigationBar: Container(
          child: BottomBarInspiredOutside(
            items: items,
            backgroundColor: Theme.of(context).colorScheme.surface,
            color: Theme.of(context).colorScheme.onSecondary,
            colorSelected: Theme.of(context).colorScheme.surface,
            iconSize: 30,
            radius: 20,
            sizeInside: 69,
            height: 45,
            chipStyle: ChipStyle(
              color: Theme.of(context).colorScheme.surface,
              background: Theme.of(context).colorScheme.primary,
            ),
            animated: true,
            indexSelected: currentIndex,
            onTap: (int index) => setState(() {
              currentIndex = index;
              pageController.animateToPage(currentIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease);
            }),
            itemStyle: ItemStyle.circle,
            fixedIndex: 1,
            fixed: true,
          ),
        ));
  }
}
