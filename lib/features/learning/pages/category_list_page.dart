import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarWidget(context,
          title: 'Categorías', showBackButton: true),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 15),
          children: <Widget>[
            ...List.generate(15, (index) {
              return CategoryItem(index: index + 1);
            })
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final int index;

  CategoryItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        //color: Color.fromARGB(115, 78, 236, 241),
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
              child: Image.asset(
                'assets/images/category.png',
                fit: BoxFit.contain,
              ),
            ),
            title: Text('Categoría $index'),
            subtitle: Text('Niveles completados $index / $index'),
            onTap: () {
              // Handle onTap event if needed
            },
          ),
          Positioned(
            top: 15,
            right: 10,
            child: Row(
              children: <Widget>[
                for (var i = 0; i < 3; i++)
                  Icon(
                    PhosphorIcons.star_fill,
                    color: Colors.amber,
                    size: 20,
                  ),
                for (var i = 0; i < 2; i++)
                  Icon(
                    PhosphorIcons.star,
                    color: Colors.amber,
                    size: 20,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
