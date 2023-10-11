import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/features/home/widgets/experience_chart_widget.dart';
import 'package:hank_talker_mobile/features/home/widgets/last_activity_card.dart';

class BodySection extends StatelessWidget {
  const BodySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  width: 90,
                  height: 9,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      borderRadius: BorderRadius.circular(15)),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Bienvenido',
                    style: Theme.of(context).textTheme.displayLarge),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      'Continuar con',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                LastActivityCard(),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      'Estadisticas',
                      style: Theme.of(context).textTheme.bodyLarge,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                ExperienceChartWidget(),
              ],
            ),
          )),
    );
  }
}
