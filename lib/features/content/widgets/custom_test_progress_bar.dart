import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:hank_talker_mobile/core/profile/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class CustomTestProgressBar extends StatelessWidget {
  // ignore: lines_longer_than_80_chars
  const CustomTestProgressBar(
      {required this.currentIndex, required this.totalQuestions, super.key});
  final int currentIndex;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.sizeOf(context).width,
        child: Row(
          children: [
            Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: IconButton(
                  alignment: Alignment.center,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.zero),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )),
            const SizedBox(
              width: 6,
            ),
            ...List.generate(totalQuestions, (index) {
              return Expanded(
                  child: Container(
                height: 15,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: index <= currentIndex
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(0.5),
                ),
              ));
            }),
            const SizedBox(
              width: 6,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  PhosphorIcons.heart_fill,
                  size: 45,
                  color: Theme.of(context).colorScheme.errorContainer,
                ),
                Text(
                  context
                      .watch<ProfileProvider>()
                      .userProfileModel
                      .statistic
                      .remainingLive
                      .toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            )
          ],
        ));
  }
}
