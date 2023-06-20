import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  final int totalSeconds;
  const TimerScreen({
    Key? key,
    required this.totalSeconds,
  }) : super(key: key);

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late int remainingSeconds;
  bool isPaused = false;

  @override
  void initState() {
    remainingSeconds = widget.totalSeconds;
    startTimer();
    super.initState();
  }

  void startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (remainingSeconds > 0 && !isPaused) {
        setState(() {
          remainingSeconds--;
        });
        startTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int minutes = remainingSeconds ~/ 60;
    int seconds = remainingSeconds % 60;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
            style: const TextStyle(
              fontSize: 100,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 100,
                icon: Icon(
                  isPaused ? Icons.play_arrow : Icons.pause,
                  size: 60,
                ),
                onPressed: () {
                  setState(() {
                    isPaused = !isPaused;
                    if (!isPaused) {
                      startTimer();
                    }
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
