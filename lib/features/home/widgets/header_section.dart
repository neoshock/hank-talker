import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/profile/models/region_model.dart';
import 'package:hank_talker_mobile/core/profile/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class HeaderSection extends StatelessWidget {
  final String name;
  final RegionModel? region;

  const HeaderSection({super.key, required this.name, this.region = null});

  Future<String> getProfileName(BuildContext context) async {
    return context.read<ProfileProvider>().userProfileModel.firstName;
  }

  @override
  Widget build(BuildContext context) {
    final String reggionName = region != null ? region!.description : '';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hola ${name}',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary)),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      reggionName == ''
                          ? 'Al parecer no ha seleccionado una región'
                          : 'Sigue aprendiendo más de $reggionName con hank talker',
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary)),
                ],
              )),
        ),
        Image.asset('assets/images/Ilustration - Home Page.png')
      ],
    );
  }
}
