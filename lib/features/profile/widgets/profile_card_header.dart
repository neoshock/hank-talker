import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/core/profile/models/profile_model.dart';
import 'package:hank_talker_mobile/features/settings/pages/privacy_page.dart';

class ProfileCardHeader extends StatelessWidget {
  final UserProfileModel userProfileModel;
  const ProfileCardHeader({
    super.key,
    required this.userProfileModel,
  });

  @override
  Widget build(BuildContext context) {
    print(userProfileModel.urlPhoto);
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.33,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                  radius: 45,
                  child: Image.network(
                    'https://static.vecteezy.com/system/resources/previews/019/896/008/original/male-user-avatar-icon-in-flat-design-style-person-signs-illustration-png.png',
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        PhosphorIcons.user_circle_bold,
                        size: 60,
                      );
                    },
                  )),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.45,
                    // ignore: lines_longer_than_80_chars
                    child: Text(
                      '${userProfileModel.firstName} ${userProfileModel.lastName}',
                      style: Theme.of(context).textTheme.displayLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    userProfileModel.status ? 'Novato' : 'Experto',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivacyPage()));
                },
                icon: Icon(
                  PhosphorIcons.note_pencil_bold,
                  color: Theme.of(context).colorScheme.onSecondary,
                  size: 36,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Se unió desde:'),
              const SizedBox(
                width: 15,
              ),
              Text(
                userProfileModel.registrationDate != null
                    ? userProfileModel.registrationDate.toString()
                    : '12/12/2012',
                style: Theme.of(context).textTheme.displaySmall,
              )
            ],
          ),
          const SizedBox(height: 6),
          Divider(
            height: 3,
            color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.25),
            thickness: 1,
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '+ ${userProfileModel.statistic.lessonsCompleted} Lecciones',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Aprendizaje total',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
              Container(
                height: 40,
                width: 1,
                color:
                    Theme.of(context).colorScheme.onSecondary.withOpacity(0.25),
              ),
              Column(
                children: [
                  Text(
                    '${userProfileModel.statistic.emeralds}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Logros',
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
