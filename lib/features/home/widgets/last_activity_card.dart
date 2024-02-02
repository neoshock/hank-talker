import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/learning/models/category_model.dart';
import 'package:hank_talker_mobile/features/learning/pages/category_detail_page.dart';
import 'package:hank_talker_mobile/features/learning/providers/learning_provider.dart';
import 'package:provider/provider.dart';

class LastActivityCard extends StatefulWidget {
  const LastActivityCard({Key? key}) : super(key: key);

  @override
  _LastActivityCardState createState() => _LastActivityCardState();
}

class _LastActivityCardState extends State<LastActivityCard> {
  Future<void> onClick(CategoryModel categoryModel) async {
    await Navigator.push(
      context,
      // ignore: inference_failure_on_instance_creation
      MaterialPageRoute(
        builder: (_) => CategoryDetailPage(
          idCategory: categoryModel.id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LearningProvider(),
      builder: (context, child) {
        return FutureBuilder(
            future: context.read<LearningProvider>().getCategoryRandom(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final category = snapshot.data!;
                return InkWell(
                    onTap: () => onClick(category),
                    child: Card(
                      elevation: 1,
                      surfaceTintColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 100,
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                padding: const EdgeInsets.all(9),
                                margin: const EdgeInsets.all(9),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withOpacity(0.5),
                                          spreadRadius: 1,
                                          offset: const Offset(0, 2))
                                    ],
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(15)),
                                child:
                                    Image.network(category.iconUrl.toString()),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    category.title,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Text(
                                    category.description,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.45,
                                        child: LinearProgressIndicator(
                                          value: (category.totalTopics -
                                                  category.pendingTopics) /
                                              (category.pendingTopics == 0
                                                  ? 1
                                                  : category.pendingTopics),
                                          minHeight: 9,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          backgroundColor: Theme.of(context)
                                              .colorScheme
                                              .onSecondary
                                              .withOpacity(0.25),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        '${category.totalTopics - category.pendingTopics}/${category.totalTopics}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          )),
                    ));
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Parece que hubo un problema'),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            });
      },
    );
  }
}

// Card(
//       elevation: 1,
//       surfaceTintColor: Theme.of(context).colorScheme.primaryContainer,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: 100,
//           child: Row(
//             children: [
//               Container(
//                 width: 80,
//                 height: 80,
//                 padding: EdgeInsets.all(9),
//                 margin: EdgeInsets.all(9),
//                 decoration: BoxDecoration(
//                     boxShadow: [
//                       BoxShadow(
//                           color: Theme.of(context)
//                               .colorScheme
//                               .primary
//                               .withOpacity(0.5),
//                           spreadRadius: 1,
//                           offset: Offset(0, 2))
//                     ],
//                     color: Theme.of(context).colorScheme.primary,
//                     borderRadius: BorderRadius.circular(15)),
//                 child: Image.asset('assets/images/category.png'),
//               ),
//               SizedBox(
//                 width: 15,
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Frases comunes',
//                     style: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   Text(
//                     'Dificultad: Media',
//                     style: Theme.of(context).textTheme.bodySmall,
//                   ),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         width: MediaQuery.sizeOf(context).width * 0.45,
//                         child: LinearProgressIndicator(
//                           value: 0.5,
//                           minHeight: 9,
//                           borderRadius: BorderRadius.circular(15),
//                           backgroundColor: Theme.of(context)
//                               .colorScheme
//                               .onSecondary
//                               .withOpacity(0.25),
//                           color: Theme.of(context).colorScheme.primary,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 6,
//                       ),
//                       Text(
//                         '3/5',
//                         style: Theme.of(context).textTheme.bodySmall,
//                       )
//                     ],
//                   )
//                 ],
//               )
//             ],
//           )),
//     );