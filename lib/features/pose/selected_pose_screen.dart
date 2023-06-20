import 'package:flutter/material.dart';

class SelectedPosesScreen extends StatelessWidget {
  final List<String> selectedPoses;

  const SelectedPosesScreen({Key? key, required this.selectedPoses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Yoga Poses'),
      ),
      body: ListView.builder(
        itemCount: selectedPoses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(selectedPoses[index]),
          );
        },
      ),
    );
  }
}
