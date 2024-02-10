import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
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
          if (categories[index].isAvailable == false) {
            return const SizedBox.shrink();
          }
          return Stack(
            alignment: Alignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    // ignore: inference_failure_on_instance_creation
                    MaterialPageRoute(
                      builder: (_) => CategoryDetailPage(
                        idCategory: categories[index].id,
                      ),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(15),
                splashFactory: InkRipple.splashFactory,
                child: Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(15),
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
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ]
                        : [],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          categories[index].iconUrl.toString(),
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
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
              ),
              Visibility(
                visible: !categories[index].isAvailable!,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Center(
                    child: Icon(
                      size: 45,
                      PhosphorIcons.lock_fill,
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
