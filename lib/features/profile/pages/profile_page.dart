import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/features/profile/widgets/curved_background.dart';
import 'package:hank_talker_mobile/features/profile/widgets/profile_card_header.dart';
import 'package:hank_talker_mobile/features/settings/pages/settings_page.dart';
import 'package:hank_talker_mobile/widgets/custom_card_widget.dart';
import 'package:hank_talker_mobile/widgets/custom_listtile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.45,
                ),
                const CurvedBackground(),
                const Positioned(bottom: 0, child: ProfileCardHeader())
              ],
            ),
            CustomCardWidget(
              children: [
                Text('Panel',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary)),
                const SizedBox(height: 15),
                CustomListtileWidget(
                    title: 'Ajustes',
                    icon: const Icon(
                      PhosphorIcons.gear_six_bold,
                      size: 30,
                    ),
                    color: Theme.of(context).colorScheme.primary,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsPage()));
                    }),
                const SizedBox(
                  height: 15,
                ),
                CustomListtileWidget(
                    title: 'Privacidad',
                    icon: const Icon(
                      PhosphorIcons.lock_key_bold,
                      size: 30,
                    ),
                    color: Theme.of(context).colorScheme.onSecondary,
                    onTap: () {}),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            CustomCardWidget(
              children: [
                Text('Cuenta',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary)),
                const SizedBox(height: 15),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text('Cerrar sesión',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)))
                  ],
                )
              ],
            ),
          ],
        )));
  }
}
