import 'package:fitbody/config/colors.dart';
import 'package:fitbody/config/styles.dart';
import 'package:fitbody/screens/notification&searchscreens/notificationscreen.dart';
import 'package:fitbody/screens/notification&searchscreens/searchscreen.dart';
import 'package:fitbody/screens/profilescreens/myprofilescreen.dart';
import 'package:fitbody/screens/workout/begiiner/intermediate/kethebellswingworkout.dart';
import 'package:flutter/material.dart';

class IntermediateWorkoutScreen extends StatefulWidget {
  const IntermediateWorkoutScreen({super.key});

  @override
  State<IntermediateWorkoutScreen> createState() =>
      _IntermediateWorkoutScreenState();
}

class _IntermediateWorkoutScreenState extends State<IntermediateWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        titleSpacing: 0,
        title: const ReuseableTextWidget(
          text: "Intermediate",
          textColor: AppColors.darkpurple,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: AppColors.yellow),
        ),
        backgroundColor: AppColors.backgroundColor,
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchScreen()));
                },
                icon: const Icon(Icons.search),
                color: AppColors.darkpurple,
                visualDensity: VisualDensity.compact,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationScreen()));
                },
                icon: const Icon(Icons.notifications),
                color: AppColors.darkpurple,
                visualDensity: VisualDensity.compact,
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyProfileScreen()));
                },
                icon: const Icon(Icons.person),
                color: AppColors.darkpurple,
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 220,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: AppColors.purple,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/workout/imgtwo.png',
                        width: double.infinity,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.yellow,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'cardio fitness',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.access_time,
                                  size: 14, color: Colors.white),
                              Text(
                                '45 Minutes',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(width: 5),
                          const Row(
                            children: [
                              Icon(Icons.local_fire_department,
                                  size: 14, color: Colors.white),
                              Text(
                                '1450 Kcal',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(width: 5),
                          const Row(
                            children: [
                              Icon(Icons.fitness_center,
                                  size: 14, color: Colors.white),
                              SizedBox(width: 4),
                              Text(
                                '5 Exercises',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const Icon(Icons.star_border,
                                size: 30, color: Colors.white),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                WorkoutRound(
                  title: 'Round 1',
                  exercises: [
                    Exercise(
                      name: 'Kettlebell swing',
                      duration: '00:30',
                      repetitions: '3x',
                      circleAvatarColor: AppColors.yellow,
                       onTap: (context) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const KetheBellWorkoutScreen()),
                        );
                      },
                    ),
                    const Exercise(
                      name: 'Shoulder Press',
                      duration: '00:15',
                      repetitions: '2x',
                      circleAvatarColor: AppColors.yellow,
                    ),
                    const Exercise(
                      name: 'Hamstring Curls',
                      duration: '00:30',
                      repetitions: '3x',
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const WorkoutRound(
                  title: 'Round 2',
                  exercises: [
                    Exercise(
                      name: 'Hamstring Curls',
                      duration: '00:10',
                      repetitions: '2x',
                    ),
                    Exercise(
                      name: 'Barbell deadlift',
                      duration: '00:10',
                      repetitions: '4x',
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WorkoutRound extends StatelessWidget {
  final String title;
  final List<Exercise> exercises;

  const WorkoutRound({
    super.key,
    required this.title,
    required this.exercises,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.yellow,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        ...exercises.map((exercise) => GestureDetector(
              onTap: exercise.onTap != null
                  ? () => exercise.onTap!(context)
                  : null,
              child: ExerciseCard(exercise: exercise),
            )),
      ],
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;

  const ExerciseCard({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: exercise.circleAvatarColor,
            radius: 20,
            child: const Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.access_time_filled,
                        size: 14, color: AppColors.purple),
                    const SizedBox(width: 4),
                    Text(
                      exercise.duration,
                      style: const TextStyle(
                        color: AppColors.purple,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            'Repetition ${exercise.repetitions}',
            style: const TextStyle(
              color: AppColors.purple,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class Exercise {
  final String name;
  final String duration;
  final String repetitions;
  final Color circleAvatarColor;
  final void Function(BuildContext)? onTap;

  const Exercise({
    required this.name,
    required this.duration,
    required this.repetitions,
    this.circleAvatarColor = AppColors.purple,
    this.onTap,
  });
}
