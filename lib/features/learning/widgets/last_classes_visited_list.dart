import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/features/learning/models/category_model.dart';

class LastClassesVisitedList extends StatelessWidget {
  const LastClassesVisitedList({required this.categories, super.key});
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(categories.length, (index) {
          return Container(
            margin: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(15),
              boxShadow: Theme.of(context).brightness == Brightness.light
                  ? [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        spreadRadius: 3,
                        blurRadius: 6,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ]
                  : [],
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {},
              leading: CircleAvatar(
                radius: 30,
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2014/04/03/00/33/hand-308667_640.png',
                  fit: BoxFit.contain,
                ),
              ),
              title: Text(categories[index].title),
              subtitle: Text(categories[index].description),
              trailing: const Icon(PhosphorIcons.arrow_right_bold),
            ),
          );
        })
      ],
    );
  }
}
