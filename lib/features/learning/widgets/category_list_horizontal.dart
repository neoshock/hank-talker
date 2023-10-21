import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/learning/models/category_model.dart';
import 'package:hank_talker_mobile/features/learning/pages/category_detail_page.dart';

class CategoryListHorizontal extends StatelessWidget {
  // ignore: lines_longer_than_80_chars
  const CategoryListHorizontal({required this.categories, super.key});
  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 150,
      child: ListView.builder(
        itemCount: categories.length,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CategoryDetailPage(
                    idCategory: 1,
                  ),
                ),
              );
            },
            borderRadius: BorderRadius.circular(15),
            splashFactory: InkRipple.splashFactory,
            child: Container(
              margin: const EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              width: 120,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(15),
                boxShadow: Theme.of(context).brightness == Brightness.light
                    ? [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.25),
                          spreadRadius: 3,
                          blurRadius: 6,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ]
                    : [],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      categories[index].imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    categories[index].title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
