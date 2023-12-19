// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/learning/pages/category_list_page.dart';
import 'package:hank_talker_mobile/features/learning/providers/learning_provider.dart';
import 'package:hank_talker_mobile/features/learning/widgets/category_list_horizontal.dart';
import 'package:hank_talker_mobile/features/learning/widgets/custom_searchbar_delegate.dart';
import 'package:provider/provider.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LearningPageState createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LearningProvider(),
      builder: (context, child) {
        return SafeArea(
          top: false,
          bottom: false,
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: CustomSearchBarDelegate(),
                pinned: true,
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Categorías disponibles',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                // ignore: inference_failure_on_instance_creation
                                MaterialPageRoute(
                                  builder: (context) => CategoryPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Ver más',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      FutureBuilder(
                        future: Provider.of<LearningProvider>(
                          context,
                          listen: false,
                        ).getAllCategories(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text(
                              'Hubo un problema al cargar las categorías, por favor seleccione una región en la sección de perfil',
                              style: Theme.of(context).textTheme.bodySmall,
                            );
                          }
                          if (snapshot.hasData) {
                            if (snapshot.data!.isEmpty) {
                              return Text(
                                'No hay categorías disponibles',
                                style: Theme.of(context).textTheme.bodyMedium,
                              );
                            }
                            return CategoryListHorizontal(
                              categories: snapshot.data!,
                            );
                          } else {
                            return const Padding(
                              padding: EdgeInsets.all(30),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Temas recientes',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'No has visto ningún tema recientemente',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
