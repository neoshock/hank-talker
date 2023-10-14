import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/profile/widgets/curved_background.dart';
import 'package:hank_talker_mobile/features/profile/widgets/profile_card_header.dart';
import 'package:hank_talker_mobile/features/settings/pages/settings_page.dart';

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
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.45,
                ),
                CurvedBackground(),
                Positioned(bottom: 0, child: ProfileCardHeader())
              ],
            )
          ],
        ));
  }
}
