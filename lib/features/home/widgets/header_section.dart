import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/profile/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class HeaderSection extends StatelessWidget {
  final String name;

  const HeaderSection({super.key, required this.name});

  Future<String> getProfileName(BuildContext context) async {
    return context.read<ProfileProvider>().userProfileModel.firstName;
  }

  @override
  Widget build(BuildContext context) {
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
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary)),
                  const SizedBox(
                    height: 15,
                  ),
                  Text('¿Qué idioma local te gustaría aprender?',
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
