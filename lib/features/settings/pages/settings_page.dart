import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/login/pages/login_page.dart';
import 'package:hank_talker_mobile/features/settings/widgets/custom_settings_list_tile.dart';
import 'package:hank_talker_mobile/features/settings/widgets/list_tile_country.dart';
import 'package:hank_talker_mobile/features/welcome/pages/welcome_page.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';
import 'package:hank_talker_mobile/widgets/custom_card_widget.dart';
import 'package:hank_talker_mobile/widgets/custom_listtile_widget.dart';
import 'package:hank_talker_mobile/widgets/custom_widgets.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            CustomAppbarWidget(context, title: 'Ajustes', showBackButton: true),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                CustomCardWidget(children: [
                  Text('Pais',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary)),
                  const ListTileCountry()
                ]),
                CustomCardWidget(children: [
                  Text('Otros ajustes',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSecondary)),
                  const SizedBox(height: 15),
                  CustomSettingsListTile(title: 'Notificaciones', onTap: () {}),
                  const SizedBox(height: 15),
                  CustomSettingsListTile(
                      title: 'política de privacidad', onTap: () {}),
                  const SizedBox(height: 15),
                  CustomSettingsListTile(
                      title: 'Términos y Condiciones', onTap: () {}),
                ]),
              ],
            ),
          ),
        ));
  }
}
