import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class CustomAvatarEdit extends StatefulWidget {
  const CustomAvatarEdit({Key? key}) : super(key: key);

  @override
  _CustomAvatarEditState createState() => _CustomAvatarEditState();
}

class _CustomAvatarEditState extends State<CustomAvatarEdit> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(15),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://img.freepik.com/premium-vector/female-user-profile-avatar-is-woman-character-screen-saver-with-emotions_505620-617.jpg'),
                      fit: BoxFit.cover)),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    color: Theme.of(context).colorScheme.primary),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    PhosphorIcons.pencil,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
