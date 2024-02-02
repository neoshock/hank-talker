import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/features/learning/providers/learning_provider.dart';
import 'package:provider/provider.dart';

class CustomFindInputWidget extends StatefulWidget {
  const CustomFindInputWidget({Key? key}) : super(key: key);

  @override
  _CustomFindInputWidgetState createState() => _CustomFindInputWidgetState();
}

class _CustomFindInputWidgetState extends State<CustomFindInputWidget> {
  void _onChanged(String value) {
    Provider.of<LearningProvider>(context, listen: false).findCategory(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width * 0.9,
        decoration: BoxDecoration(
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
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: TextField(
                  onChanged: (e) {
                    _onChanged(e);
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 18),
                      hintText: 'Buscar',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.5)),
                      border: InputBorder.none),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(PhosphorIcons.magnifying_glass_bold,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.5)),
            )
          ],
        ));
  }
}
