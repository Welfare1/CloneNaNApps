import 'package:clone_nan_app/models/courses/courses.dart';
import 'package:flutter/material.dart';

class DetailCourses extends StatelessWidget {
  int mindex;
  int mindex1;
  String title;
  int nbSections;
  DetailCourses(
      {super.key,
      required this.mindex,
      required this.mindex1,
      required this.title,
      required this.nbSections});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
          itemCount: nbSections,
          itemBuilder: (ctx, index) {
            //Getting name

            var section = myCourses[mindex]
                    [myCourses[mindex].keys.first]![mindex1]!["ressources"]
                as Map<int, Map>;
            // int lengthSections = section.key ;
            // print(myCourses[index].keys.first);
            print(section.keys);
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 0.1, color: Colors.yellow)),
              child: ExpansionTile(
                title: Text(section[index]!["title section"] ?? ""),
                children: List.generate(
                    (section[index]!["videos"] as List).length,
                    (index1) => Column(
                          children: [
                            ListTile(
                              leading: Text("${index1 + 1}"),
                              title: Text(
                                  "${section[index]!["videos"][index1][0] + section[index]!["videos"][index1][1]}"),
                              onTap: () {},
                              trailing: (section[index]!["videos"][index1][1] ==
                                      ".mp4")
                                  ? Icon(
                                      Icons.play_circle,
                                      color: Colors.deepPurple,
                                    )
                                  : Icon(
                                      Icons.file_download,
                                      color: Colors.grey,
                                    ),
                            )
                          ],
                        )),
              ),
            );
          }),
    );
  }
}
