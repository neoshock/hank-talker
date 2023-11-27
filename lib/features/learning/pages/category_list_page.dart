import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/features/learning/models/category_model.dart';
import 'package:hank_talker_mobile/features/learning/pages/category_detail_page.dart';
import 'package:hank_talker_mobile/features/learning/providers/learning_provider.dart';
import 'package:hank_talker_mobile/utils/file_type_interceptor.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LearningProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: CustomAppbarWidget(context,
              title: 'Categorías', showBackButton: true),
          body: SafeArea(
              child: FutureBuilder(
            future: context.read<LearningProvider>().getAllCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final categories = snapshot.data!;
                if (categories.isEmpty) {
                  return Center(
                    child: Text(
                      'No hay categorias disponibles',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  );
                }
                return ListView(
                  padding: EdgeInsets.only(top: 15),
                  children: <Widget>[
                    ...List.generate(categories.length, (index) {
                      return CategoryItem(
                        category: categories[index],
                      );
                    })
                  ],
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Parece que hubo un problema'),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
        );
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  final CategoryModel category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    final puntuacion = (category.pendingTopics / category.totalTopics) * 5;

    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: Theme.of(context).brightness == Brightness.light
            ? [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.25),
                  spreadRadius: 3,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ]
            : [],
      ),
      child: Stack(
        children: <Widget>[
          ListTile(
            contentPadding: const EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            tileColor: Theme.of(context).colorScheme.surface,
            leading: CircleAvatar(
                radius: 30,
                child: FileInterceptorWidget(
                    fileUrl: category.iconUrl.toString())),
            title: Text(category.title),
            subtitle: Text(
                'Niveles completados ${category.pendingTopics} / ${category.totalTopics}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CategoryDetailPage(
                    idCategory: category.id,
                  ),
                ),
              );
            },
          ),
          Positioned(
            top: 15,
            right: 10,
            child: Row(
              children: <Widget>[
                ...List.generate(
                    5,
                    (index) => Icon(
                          PhosphorIcons.star_fill,
                          color:
                              index < puntuacion ? Colors.yellow : Colors.grey,
                        ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
