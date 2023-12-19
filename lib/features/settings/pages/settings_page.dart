import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/profile/models/region_model.dart';
import 'package:hank_talker_mobile/core/profile/providers/profile_provider.dart';
import 'package:hank_talker_mobile/core/repositories/http_model.dart';
import 'package:hank_talker_mobile/features/settings/widgets/custom_settings_list_tile.dart';
import 'package:hank_talker_mobile/widgets/CustomFlagDropdownButton.dart';
import 'package:hank_talker_mobile/widgets/custom_appbar_widget.dart';
import 'package:hank_talker_mobile/widgets/custom_card_widget.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  RegionModel? _selectedRegion;

  @override
  void initState() {
    asyncInit();
    super.initState();
  }

  Future<HttpBaseResponse> _getRegions() async {
    return Provider.of<ProfileProvider>(context, listen: false).getRegions();
  }

  Future<void> _onChanged(RegionModel? region) async {
    await Provider.of<ProfileProvider>(context, listen: false)
        .setRegion(region!);
    setState(() {
      _selectedRegion = region;
    });
  }

  Future<void> asyncInit() async {
    _selectedRegion =
        await Provider.of<ProfileProvider>(context, listen: false).getRegion();
  }

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
                  Text('País', style: Theme.of(context).textTheme.bodyMedium),
                  FutureBuilder(
                    future: _getRegions(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return CustomFlagDropdownButton(
                          regions: snapshot.data!.data as List<RegionModel>,
                          onChanged: _onChanged,
                          selectedRegion: _selectedRegion,
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  )
                  //
                ]),
                CustomCardWidget(children: [
                  Text('Otros ajustes',
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 15),
                  CustomSettingsListTile(title: 'Notificaciones', onTap: () {}),
                  const SizedBox(height: 15),
                  CustomSettingsListTile(
                      title: 'Política de privacidad', onTap: () {}),
                  const SizedBox(height: 15),
                  CustomSettingsListTile(
                      title: 'Términos y condiciones', onTap: () {}),
                ]),
              ],
            ),
          ),
        ));
  }
}
