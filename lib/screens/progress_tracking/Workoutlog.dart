import 'package:flutter/material.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:fitbody/config/colors.dart';
class WorkoutLogScreen extends StatefulWidget {
  const WorkoutLogScreen({super.key});

  @override
  State<WorkoutLogScreen> createState() => _WorkoutLogScreenState();
}

class _WorkoutLogScreenState extends State<WorkoutLogScreen> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20),
            child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.grey[350]!),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: Text(
                      _selectedDate != null
                          ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
                          : "Select a date",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  color: AppColors.white,
                  child: CalendarDatePicker2(
                    config: CalendarDatePicker2Config(
                      calendarType: CalendarDatePicker2Type.single,
                      selectedDayHighlightColor: AppColors.darkpurple,
                      selectedRangeHighlightColor: Colors.red,
                      dayTextStyle: const TextStyle(color: Colors.black),
                      disabledDayTextStyle: const TextStyle(color: Colors.grey),
                    ),
                    value: _selectedDate != null ? [_selectedDate!] : [DateTime.now()],
                    onValueChanged: (dates) {
                      if (dates.isNotEmpty) {
                        setState(() {
                          _selectedDate = dates[0];
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
              Text(
              "Activities",
              style: TextStyle(
                color: AppColors.yellow,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
                            ),
                Expanded(
                  child: ListView(
 
                    children: const [
                      ActivityCard(
                        calories: '120 Kcal',
                        title: 'Upper Body Workout',
                        date: 'June 09',
                        duration: '25 Mins',
                      ),
                      SizedBox(height: 16),
                      ActivityCard(
                        calories: '130 Kcal',
                        title: 'Pull Out',
                        date: 'April 15 - 4:00 PM',
                        duration: '30 Mins',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String calories;
  final String title;
  final String date;
  final String duration;

  const ActivityCard({super.key, 
    required this.calories,
    required this.title,
    required this.date,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.purple,
              child: Icon(
                Icons.fitness_center,
                size: 16,
                color: AppColors.white,
              ),
            ),
            const SizedBox(width: 12), 
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      children: [ const Icon(
                Icons.fitness_center,
                size: 16,
                color: AppColors.purple,
              ),
                          Text(
                        calories,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      ],
                    ), 
                      Row(
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(), 
                          Column(
                            children: [
                              const Text("Decoration",style: 
                              TextStyle(color: AppColors.darkpurple),),
                              Row(
                            children: [
                              const Icon(
                                Icons.timelapse_outlined,
                                size: 16,
                                color: AppColors.darkpurple,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                duration,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: AppColors.darkpurple,
                                ),
                              ),
                            ],
                          ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ), 
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.darkpurple,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}