import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hank_talker_mobile/core/profile/models/experience_week_model.dart';
import 'package:hank_talker_mobile/core/profile/providers/profile_provider.dart';
import 'package:provider/provider.dart';

class ExperienceChartWidget extends StatefulWidget {
  const ExperienceChartWidget({required this.experience, super.key});
  final int experience;

  @override
  _ExperienceChartWidgetState createState() => _ExperienceChartWidgetState();
}

class _ExperienceChartWidgetState extends State<ExperienceChartWidget> {
  List<ExperienceWeek> experienceWeekData = [];
  List<FlSpot> chartPoints = [];

  @override
  void initState() {
    super.initState();
    asyncInit();
  }

  Future<void> asyncInit() async {
    if (mounted) {
      final data = await context.read<ProfileProvider>().getExperienceWeek();
      // ignore: use_build_context_synchronously
      if (data.code == 200) {
        setState(() {
          experienceWeekData = data.data as List<ExperienceWeek>;
          chartPoints = parseExperienceData(experienceWeekData);
        });
      }
    }
  }

  List<FlSpot> parseExperienceData(List<ExperienceWeek> data) {
    return List.generate(data.length, (index) {
      final expWeek = data[index];
      // Convierte la fecha en un valor numérico, por ejemplo, usando el índice
      final x = index.toDouble();
      // Usa el valor de experiencia como el valor de Y
      final y = expWeek.experience.toDouble();
      return FlSpot(x, y);
    });
  }

  @override
  Widget build(BuildContext context) {
    final chartColor = Theme.of(context).colorScheme.secondary;
    return Card(
      elevation: 1,
      surfaceTintColor: Theme.of(context).colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Experiencia obtenida',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          '${widget.experience} EXP',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: chartColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        '1',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            AspectRatio(
              aspectRatio: 2,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(
                    show: false,
                  ),
                  titlesData: const FlTitlesData(
                    show: false,
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: chartPoints,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            chartColor.withOpacity(0.3),
                            chartColor.withOpacity(0.1),
                          ],
                        ),
                      ),
                      isCurved: true,
                      barWidth: 5,
                      isStrokeCapRound: true,
                      color: chartColor,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
