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
          body: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/contenido.png'),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    child: Text(
                      'Alfabeto',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    top: 110,
                    left: 20,
                  ),
                  Positioned(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Text(
                        'Loren ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    top: 140,
                    left: 20,
                  )
                ],
              ),
              Expanded(
                child: FutureBuilder(
                  future: context.read<LearningProvider>().getAllCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final categories = snapshot.data;
                      return ListView(
                        padding: EdgeInsets.zero,
                        children: <Widget>[
                          ...List.generate(categories!.length, (index) {
                            return CategoryItem(
                              category: categories[index],
                              color: index % 2 == 0
                                  ? Theme.of(context).colorScheme.surface
                                  : Theme.of(context).colorScheme.error,
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
              )
            ],
          ),
        );
      },
    );
  }
}

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final Color color;

  CategoryItem({required this.category, required this.color});

  @override
  Widget build(BuildContext context) {
    // double puntuacion = (category.completedLeves / category.totalLeves) * 5;

    return Container(
      decoration: BoxDecoration(
        color: color,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
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
      ),
    );
  }
}
