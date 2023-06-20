import 'package:flutter/material.dart';
import 'package:sequence_mate/features/pose/yoga_poses_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoga Poses Selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const YogaPosesScreen(),
    );
  }
}
