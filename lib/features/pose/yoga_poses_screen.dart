import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:sequence_mate/features/pose/selected_pose_screen.dart';

class YogaPosesScreen extends StatefulWidget {
  const YogaPosesScreen({super.key});

  @override
  _YogaPosesScreenState createState() => _YogaPosesScreenState();
}

class _YogaPosesScreenState extends State<YogaPosesScreen> {
  final int _currentValue = 30;
  List<String> yogaPoses = [
    '가루다아사나',
    '고무카아사나',
    '나바아사나',
    '단다아사나',
    '다누라아사나',
    '바카아사나',
    '받다 코나아사나',
    '발아사나',
    '부장가아사나',
    '브릭샤아사나',
    '비라바드라아사나',
    '사르방가아사나',
    '사바아사나',
    '세투 반다아사나',
    '시르사아사나',
    '차투랑가',
    '카카아사나',
    '타다아사나',
    '윤지바보',
  ];

  Map<String, int> selectedPoses = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Yoga Poses'),
      ),
      body: ListView.builder(
        itemCount: yogaPoses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(yogaPoses[index]),
            trailing: selectedPoses.containsKey(yogaPoses[index])
                ? IconButton(
                    icon: const Icon(Icons.timer),
                    onPressed: () async {
                      final TextEditingController controller =
                          TextEditingController();
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title:
                                Text("Pick duration for ${yogaPoses[index]}"),
                            content: TextFormField(
                              controller: controller,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: "Enter time in seconds",
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text("Cancel"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: const Text("OK"),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(int.parse(controller.text));
                                },
                              ),
                            ],
                          );
                        },
                      ).then((value) {
                        if (value != null) {
                          setState(() {
                            selectedPoses[yogaPoses[index]] = value;
                          });
                        }
                      });
                    })
                : IconButton(
                    icon: const Icon(Icons.check_box_outline_blank),
                    onPressed: () {
                      setState(() {
                        selectedPoses[yogaPoses[index]] = 0;
                      });
                    },
                  ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SelectedPosesScreen(selectedPoses: selectedPoses),
            ),
          );
        },
      ),
    );
  }
}
