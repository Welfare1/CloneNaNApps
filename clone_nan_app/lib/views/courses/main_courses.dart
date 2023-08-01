import 'package:clone_nan_app/models/courses/courses.dart';
import 'package:clone_nan_app/views/courses/main_courses_details.dart';
import 'package:flutter/material.dart';

class MainCourses extends StatelessWidget {
  const MainCourses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: myCourses.length,
        itemBuilder: (ctx, index) {
          //Getting name
          int lengthMyCourse = myCourses.length;
          Map<int, Map<dynamic, dynamic>> section =
              myCourses[index][myCourses[index].keys.first] ?? {};

          print(myCourses[index].keys.first);
          print(section.keys);
          return Container(
            decoration: BoxDecoration(
                border: Border.all(width: 0.1, color: Colors.yellow)),
            child: ExpansionTile(
              title: Text(myCourses[index].keys.toString()),
              children: List.generate(
                  section.keys.length,
                  (index1) => Column(
                        children: [
                          ListTile(
                            leading: Text("${index1 + 1}"),
                            title: Text(section[index1]!["title"]),
                            onTap: () {
                              var sections =
                                  section[index1]!["ressources"] as Map;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailCourses(
                                          mindex: index,
                                          mindex1: index1,
                                          title: section[index1]!["title"],
                                          nbSections: sections.keys.length)));
                            },
                            trailing: const Icon(Icons.arrow_circle_right),
                          )
                        ],
                      )),
            ),
          );
        });
  }
}
