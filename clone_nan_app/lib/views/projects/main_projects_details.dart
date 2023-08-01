import 'package:clone_nan_app/models/Projects/project.dart';
import 'package:clone_nan_app/models/courses/courses.dart';
import 'package:flutter/material.dart';

class DetailProjects extends StatelessWidget {
  int mindex;
  String title;
  DetailProjects({super.key, required this.mindex, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("## Description",
                    style: TextStyle(
                        color: Color.fromARGB(255, 151, 136, 5),
                        fontWeight: FontWeight.bold)),
                Text(myProjects[mindex]["Libéllé"]),
                const SizedBox(),
                const Text(
                  "##Instruction",
                  style: TextStyle(
                      color: Colors.deepPurple, fontWeight: FontWeight.bold),
                ),
                ...(myProjects[mindex]["Instructions"] as List)
                    .map((e) => Text("-" + e)),
                const SizedBox(),
                const Text("## NB",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold)),
                Text(myProjects[mindex]["NB"][0],
                    style: const TextStyle(color: Colors.redAccent))
              ],
            ),
          ),
        ));
  }
}
