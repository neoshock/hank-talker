import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/learning/models/category_model.dart';
import 'package:hank_talker_mobile/features/learning/providers/learning_provider.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';
import 'package:provider/provider.dart';

class ContenidoPage extends StatefulWidget {
  @override
  _ContenidoPageState createState() => _ContenidoPageState();
}

class _ContenidoPageState extends State<ContenidoPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LearningProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: CustomAppbarWidget(context,
              title: 'Contenido', showBackButton: true),
          extendBodyBehindAppBar: true,
          body: Stack(
            children: <Widget>[
              Positioned(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://img.freepik.com/vector-premium/imagenes-vectoriales-bosque-dia_46176-155.jpg'),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: FutureBuilder(
                  future: context.read<LearningProvider>().getAllCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final categories = snapshot.data;
                      return ListView(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.15),
                        children: <Widget>[
                          ...List.generate(categories!.length, (index) {
                            return CategoryItem(
                              category: categories[index],
                            );
                          })
                        ],
                      );
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
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
    double puntuacion = (category.completedLeves / category.totalLeves) * 5;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      tileColor: Theme.of(context).colorScheme.surface,
      leading: CircleAvatar(
        radius: 60,
        child: Image.network(
          category.imageUrl,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(category.title),
      subtitle: Text(
          'Loren ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
      onTap: () {
        // Handle onTap event if needed
      },
    );
  }
}
