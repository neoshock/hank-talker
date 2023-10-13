import 'package:flutter/material.dart';

class CategoryListHorizontal extends StatelessWidget {
  const CategoryListHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 150,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
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
                      child: Image.asset(
                        'assets/images/Logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Categoría ${index + 1}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ));
          }),
    );
  }
}
