import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/features/settings/pages/privacy_page.dart';

class ProfileCardHeader extends StatelessWidget {
  const ProfileCardHeader({
    required this.name,
    required this.status,
    required this.joinedDate,
    required this.photoUrl,
    required this.totalLessons,
    required this.totalRewards,
    super.key,
  });
  final String name;
  final String status;
  final String joinedDate;
  final String photoUrl;
  final int totalLessons;
  final int totalRewards;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.33,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(radius: 45, backgroundImage: NetworkImage(photoUrl)),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    status,
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
                joinedDate,
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
                    '+$totalLessons Lecciones',
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
                    totalRewards.toString(),
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
