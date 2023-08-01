import 'package:flutter/material.dart';
import 'dart:async';

class CountdownPage extends StatefulWidget {
  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  final DateTime targetDate = DateTime.now().add(Duration(days: 30));
  Timer? _timer;
  String timeRemaining = '';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final difference = targetDate.difference(now);

      if (difference.isNegative) {
        setState(() {
          timeRemaining = 'Terminé!';
        });
        _timer?.cancel();
      } else {
        setState(() {
          timeRemaining =
              '${difference.inDays} d ${difference.inHours % 24} h ${difference.inMinutes % 60} m ${difference.inSeconds % 60} secondes';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Welcome Welfare !"),
        Flexible(
          flex: 1,
          child: Card(
            color: Colors.deepPurple,
            elevation: 1,
            child: Center(
              child: Column(children: [
                Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      timeRemaining,
                      style: TextStyle(fontSize: 13, color: Colors.deepPurple),
                    ),
                  ),
                ),
                Text("before submission of the month project",
                    style: TextStyle(fontSize: 16, color: Colors.white))
              ]),
            ),
          ),
        ),
        const Text("# infos: "),
        const Text("You are student in the flutter speciality"),
        const Text("Satus: Online"),
        Flexible(flex: 6, child: CircularContainersApp())
      ],
    );
  }
}

class CircularContainersApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 9,
        runSpacing: 5,
        alignment: WrapAlignment.center,
        children: [
          CircularContainer(
            text: '150',
            title: "Total",
          ),
          CircularContainer(text: '90', title: "Courses"),
          CircularContainer(text: '14', title: "Ranking"),
          CircularContainer(text: '0.75', title: "Projects"),
        ],
      ),
    );
  }
}

class CircularContainer extends StatelessWidget {
  final String text;
  final String title;

  CircularContainer({required this.text, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 90,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(width: 3, color: Colors.deepPurple)),
      child: Center(
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.deepPurple, fontSize: 24),
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
