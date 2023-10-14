import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/login/pages/login_page.dart';
import 'package:hank_talker_mobile/features/settings/widgets/custom_settings_list_tile.dart';
import 'package:hank_talker_mobile/features/settings/widgets/list_tile_country.dart';
import 'package:hank_talker_mobile/features/welcome/pages/welcome_page.dart';
import 'package:hank_talker_mobile/widgets/custom_card_widget.dart';
import 'package:hank_talker_mobile/widgets/custom_listtile_widget.dart';
import 'package:hank_talker_mobile/widgets/custom_widgets.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          automaticallyImplyLeading: false,
          title: const Text(
            'Ajustes',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leadingWidth: 76,
          leading: Container(
            margin: const EdgeInsets.only(left: 18),
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: CustomBackButton(context, () {
              Navigator.pop(context);
            }),
          ),
          centerTitle: true,
        ),
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
