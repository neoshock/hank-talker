import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/home/widgets/experience_chart_widget.dart';
import 'package:hank_talker_mobile/features/home/widgets/last_activity_card.dart';

class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                width: 90,
                height: 6,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Bienvenido',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Continuar con',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const LastActivityCard(),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Estadisticas',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const ExperienceChartWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
