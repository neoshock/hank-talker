import 'package:flutter/material.dart';

class LastActivityCard extends StatelessWidget {
  const LastActivityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      surfaceTintColor: Theme.of(context).colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                padding: EdgeInsets.all(9),
                margin: EdgeInsets.all(9),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.5),
                          spreadRadius: 1,
                          offset: Offset(0, 2))
                    ],
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset('assets/images/category.png'),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Frases comunes',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Dificultad: Media',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.45,
                        child: LinearProgressIndicator(
                          value: 0.5,
                          minHeight: 9,
                          borderRadius: BorderRadius.circular(15),
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(0.25),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        '3/5',
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  )
                ],
              )
            ],
          )),
    );
  }
}
