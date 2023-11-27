import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/core/auth/providers/auth_provider.dart';
import 'package:hank_talker_mobile/core/profile/providers/profile_provider.dart';
import 'package:hank_talker_mobile/features/login/pages/login_page.dart';
import 'package:hank_talker_mobile/features/profile/widgets/curved_background.dart';
import 'package:hank_talker_mobile/features/profile/widgets/profile_card_header.dart';
import 'package:hank_talker_mobile/features/settings/pages/privacy_page.dart';
import 'package:hank_talker_mobile/features/settings/pages/settings_page.dart';
import 'package:hank_talker_mobile/widgets/custom_card_widget.dart';
import 'package:hank_talker_mobile/widgets/custom_listtile_widget.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _logout() async {
    final res = await context.read<AuthProvider>().logout();
    if (res) {
      // ignore: use_build_context_synchronously
      await Navigator.pushAndRemoveUntil(
        context,
        // ignore: inference_failure_on_instance_creation
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<ProfileProvider>().userProfileModel;
    return SafeArea(
        top: false,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                ),
                const CurvedBackground(),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.12,
                  child: ProfileCardHeader(
                    userProfileModel: user,
                  ),
                )
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrivacyPage()));
                    }),
              ],
            ),
            const SizedBox(
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
                        onPressed: _logout,
                        child: Text('Cerrar sesión',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.error)))
                  ],
                )
              ],
            ),
          ],
        )));
  }
}
