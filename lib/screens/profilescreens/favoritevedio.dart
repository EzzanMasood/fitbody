import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:fitbody/config/colors.dart';

class FavoriteVedioScreen extends StatefulWidget {
  const FavoriteVedioScreen({super.key});

  @override
  State<FavoriteVedioScreen> createState() => _FavoriteVedioScreenState();
}

class _FavoriteVedioScreenState extends State<FavoriteVedioScreen> {
  final List<Map<String, dynamic>> trainings = [
    {
      "title": "Upper Body",
      "duration": "60 Minutes",
      "calories": "1320 Kcal",
      "exercises": "5 Exercises",
      "videoPath": "assets/videos/vedioone.mp4",
    },
    {
      "title": "Pull Out",
      "duration": "30 Minutes",
      "calories": "1710 Kcal",
      "exercises": "10 Exercises",
      "videoPath": "assets/videos/vediotwo.mp4",
    },
    {
      "title": "Loop Band Exercises",
      "duration": "45 Minutes",
      "calories": "785 Kcal",
      "exercises": "6 Exercises",
      "videoPath": "assets/videos/vedioone.mp4",
    },
    {
      "title": "Dumbbell Step Up",
      "duration": "17 Minutes",
      "calories": "1385 Kcal",
      "exercises": "3 Exercises",
      "videoPath": "assets/videos/vediotwo.mp4",
    },
    {
      "title": "Split Strength Training",
      "duration": "12 Minutes",
      "calories": "1250 Kcal",
      "exercises": "5 Exercises",
      "videoPath": "assets/videos/vedioone.mp4",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Expanded( // Allows ListView to scroll within available space
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: trainings.length,
            physics: const AlwaysScrollableScrollPhysics(), // Enables scrolling
            itemBuilder: (context, index) {
              final training = trainings[index];
              return _buildTrainingCard(
                title: training["title"]!,
                duration: training["duration"]!,
                calories: training["calories"]!,
                exercises: training["exercises"]!,
                videoPath: training["videoPath"]!,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTrainingCard({
    required String title,
    required String duration,
    required String calories,
    required String exercises,
    required String videoPath,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        duration,
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.local_fire_department, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        calories,
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.fitness_center, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        exercises,
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          VideoPlayerWidget(videoPath: videoPath),
        ],
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({super.key, required this.videoPath});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black26,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (_controller.value.isInitialized)
            GestureDetector(
              onTap: () {
                if (isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
                setState(() {
                  isPlaying = !isPlaying;
                });
              },
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            )
          else
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (!isPlaying)
            const CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.purple,
              child: Icon(
                Icons.play_arrow,
                size: 28,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}