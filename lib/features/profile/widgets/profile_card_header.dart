import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class ProfileCardHeader extends StatelessWidget {
  const ProfileCardHeader({Key? key}) : super(key: key);

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
              const CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/premium-vector/female-user-profile-avatar-is-woman-character-screen-saver-with-emotions_505620-617.jpg')),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    'novato',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  PhosphorIcons.note_pencil_bold,
                  color: Theme.of(context).colorScheme.onSecondary,
                  size: 36,
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Se unió desde:'),
              const SizedBox(
                width: 15,
              ),
              Text(
                '01/01/2021',
                style: Theme.of(context).textTheme.displaySmall,
              )
            ],
          ),
          const SizedBox(height: 15),
          Divider(
            color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.25),
            thickness: 1,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '+15 Lecciones',
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
                    '20',
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
