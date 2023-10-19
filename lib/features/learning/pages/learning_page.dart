import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/features/learning/pages/category_list_page.dart';
import 'package:hank_talker_mobile/features/learning/widgets/category_list_horizontal.dart';
import 'package:hank_talker_mobile/features/learning/widgets/custom_find_input_widget.dart';
import 'package:hank_talker_mobile/features/learning/widgets/custom_searchbar_delegate.dart';
import 'package:hank_talker_mobile/features/learning/widgets/learning_header.dart';

class LearningPage extends StatefulWidget {
  const LearningPage({Key? key}) : super(key: key);

  @override
  _LearningPageState createState() => _LearningPageState();
}

class _LearningPageState extends State<LearningPage> {
  @override
  Widget build(BuildContext context) {
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
                            'Categorias disponibles',
                            style: Theme.of(context).textTheme.bodyLarge,
                          )),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CategoryPage()),
                              );
                            },
                            child: const Text(
                              'Ver mas',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      const CategoryListHorizontal(),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Text(
                            'Ultimas clases visitadas',
                            style: Theme.of(context).textTheme.bodyLarge,
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ...List.generate(15, (index) {
                        return Container(
                          margin: const EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: Theme.of(context).brightness ==
                                    Brightness.light
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
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            onTap: () {},
                            leading: CircleAvatar(
                              radius: 30,
                              child: Image.asset(
                                'assets/images/Logo.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                            title: Text('Clase ${index + 1}'),
                            subtitle: Text('Categoría ${index + 1}'),
                            trailing:
                                const Icon(PhosphorIcons.arrow_right_bold),
                          ),
                        );
                      })
                    ],
                  ),
                ))
          ],
        ));
  }
}
