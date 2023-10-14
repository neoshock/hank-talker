import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class CustomSettingsListTile extends StatelessWidget {
  // ignore: lines_longer_than_80_chars
  const CustomSettingsListTile(
      {required this.title, required this.onTap, super.key});
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: const Icon(PhosphorIcons.caret_right_bold),
      onTap: () => onTap(),
    );
  }
}
