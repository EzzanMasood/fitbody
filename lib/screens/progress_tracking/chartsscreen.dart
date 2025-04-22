import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ChartsScreen extends StatefulWidget {
  const ChartsScreen({super.key});

  @override
  State<ChartsScreen> createState() => _ChartsScreenState();
}

class _ChartsScreenState extends State<ChartsScreen> {
  final List<Map<String, String>> stepsData = [
    {"day": "Thu", "date": "14", "steps": "3,679", "duration": "1hr40m"},
    {"day": "Wed", "date": "20", "steps": "5,789", "duration": "1hr20m"},
    {"day": "Sat", "date": "22", "steps": "1,859", "duration": "1hr10m"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ReuseableTextWidget(
              text: "My Progress",
              fontSize: 12,
              textColor: AppColors.yellow,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ReuseableTextWidget(
              text: "January 12th",
              fontSize: 16,
              textColor: AppColors.yellow,
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 250,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 200,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          String text = "";
                          switch (value.toInt()) {
                            case 0:
                              text = 'Jan';
                              break;
                            case 1:
                              text = 'Feb';
                              break;
                            case 2:
                              text = 'Mar';
                              break;
                            case 3:
                              text = 'Apr';
                              break;
                            default:
                              text = '';
                          }
                          return Text(
                            text,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            value.toInt().toString(),
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          );
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey),
                  ),
                  barGroups: [
                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                          toY: 155,
                          color: AppColors.yellow,
                          width: 20,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: 180,
                          color: AppColors.yellow,
                          width: 20,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          toY: 170,
                          color: AppColors.yellow,
                          width: 20,
                        ),
                      ],
                    ),
                    BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(
                          toY: 190,
                          color: AppColors.yellow,
                          width: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: stepsData.length,
              itemBuilder: (context, index) {
                final item = stepsData[index];

                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.darkpurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item["day"]!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                item["date"]!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(width: 16),
                          Container(
                            height: 30,
                            width: 1.5,
                            color: Colors.white,
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Steps",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 12),
                              ),
                              Text(
                                item["steps"]!,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Duration",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 12),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.access_time,
                                      color: Colors.white, size: 14),
                                  SizedBox(width: 5),
                                  Text(
                                    item["duration"]!,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
