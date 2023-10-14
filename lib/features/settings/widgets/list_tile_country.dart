import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class ListTileCountry extends StatelessWidget {
  const ListTileCountry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        subtitle: Row(
          children: [
            const SizedBox(height: 50),
            Image.asset(
              'assets/images/ecuador_logo.png', // Ruta de la imagen de Ecuador
              width: 40,
              height: 40,
            ),
            const SizedBox(width: 20), // Espaciado entre el logo y el texto
            const Text(
              'Ecuador',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        trailing: const Icon(PhosphorIcons.caret_right_bold),
        onTap: () {},
      ),
    );
  }
}
