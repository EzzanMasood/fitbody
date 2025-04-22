import 'package:fitbody/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ExerciseCard extends StatefulWidget {
  final String videoAssetPath;
  final String title;
  final String time;
  final String calories;

  const ExerciseCard({
    super.key,
    required this.videoAssetPath,
    required this.title,
    required this.time,
    required this.calories,
  });

  @override
  _ExerciseCardState createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  late VideoPlayerController _controller;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAssetPath)
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true)
      ..setVolume(0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .5,

      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: const Border(bottom: BorderSide(color: Colors.white, width: 2)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * .5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.purple,
                        ),
                      ),
              ),
              Positioned(
                right: 6,
                bottom: -15,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: AppColors.purple,
                    radius: 16,
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFavorite = !_isFavorite; 
                    });
                  },
                  child: Icon(
                    _isFavorite ? Icons.star : Icons.star, 
                    color: _isFavorite ? Colors.yellow : Colors.white, 
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.timer, color: AppColors.purple, size: 16),
                        Text(
                          widget.time,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(width: 4),
                    Row(
                      children: [
                        const Icon(Icons.local_fire_department,
                            color: AppColors.purple, size: 16),
                        Text(
                          widget.calories,
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExerciseCardList extends StatelessWidget {
  const ExerciseCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, 
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            3,
            (index) {
              return Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: const ExerciseCard(
                      videoAssetPath: 'assets/videos/vedioone.mp4',
                      title: 'Squat Exercise',
                      time: '12 Minutes',
                      calories: '120 Kcal',
                    ),
                  ),
                  if (index != 2) const SizedBox(width: 20),
                  
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
