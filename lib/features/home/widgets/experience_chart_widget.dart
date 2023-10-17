import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExperienceChartWidget extends StatefulWidget {
  const ExperienceChartWidget({super.key});

  @override
  _ExperienceChartWidgetState createState() => _ExperienceChartWidgetState();
}

class _ExperienceChartWidgetState extends State<ExperienceChartWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final chartColor = Theme.of(context).colorScheme.secondary;
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
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
                            '500 EXP',
                            style: Theme.of(context).textTheme.displayMedium,
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: chartColor.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          '1',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              AspectRatio(
                aspectRatio: 2,
                child: LineChart(LineChartData(
                  gridData: const FlGridData(
                    show: false,
                  ),
                  titlesData: const FlTitlesData(
                    show: false,
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  minX: 0,
                  maxX: 11,
                  minY: 0,
                  maxY: 6,
                  lineBarsData: [
                    LineChartBarData(
                        belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  chartColor.withOpacity(0.3),
                                  chartColor.withOpacity(0.1),
                                ])),
                        spots: const [
                          FlSpot(0, 3),
                          FlSpot(2.6, 2),
                          FlSpot(4.9, 5),
                          FlSpot(6.8, 3.1),
                          FlSpot(8, 4),
                          FlSpot(9.5, 3),
                          FlSpot(11, 4),
                        ],
                        isCurved: true,
                        barWidth: 5,
                        isStrokeCapRound: true,
                        color: chartColor),
                  ],
                )),
              ),
            ],
          )),
    );
  }
}
