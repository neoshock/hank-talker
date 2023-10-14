import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class CustomListtileWidget extends StatelessWidget {
  const CustomListtileWidget(
      {required this.title,
      required this.icon,
      required this.onTap,
      required this.color,
      super.key});
  final String title;
  final Icon icon;
  final Function onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () => onTap(),
      leading: CircleAvatar(
        child: icon,
        radius: 24,
        backgroundColor: color,
      ),
      title: Text(title),
      trailing: Icon(PhosphorIcons.caret_right_bold),
    );
  }
}
