import 'package:flutter/material.dart';
import 'package:sequence_mate/features/timer/timer_screen.dart';

class SelectedPosesScreen extends StatefulWidget {
  final Map<String, int> selectedPoses;

  const SelectedPosesScreen({
    Key? key,
    required this.selectedPoses,
  }) : super(key: key);

  @override
  State<SelectedPosesScreen> createState() => _SelectedPosesScreenState();
}

class _SelectedPosesScreenState extends State<SelectedPosesScreen> {
  late int totalSeconds;

  @override
  void initState() {
    super.initState();
    totalSeconds = widget.selectedPoses.values
        .fold(0, (previous, current) => previous + current);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Yoga Poses'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.builder(
              itemCount: widget.selectedPoses.length,
              itemBuilder: (context, index) {
                String pose = widget.selectedPoses.keys.elementAt(index);
                return ListTile(
                  title: Text('$pose - ${widget.selectedPoses[pose]} seconds'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        TimerScreen(totalSeconds: totalSeconds),
                  ),
                );
              },
              child: const Text(
                'Start Timer',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
