import 'package:clone_nan_app/models/Projects/project.dart';
import 'package:clone_nan_app/views/projects/main_projects_details.dart';
import 'package:flutter/material.dart';

class MainProjects extends StatelessWidget {
  const MainProjects({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: myProjects.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(border: Border.all(width: 0.1)),
            child: ListTile(
              leading: const Icon(Icons.list),
              subtitle: Text(myProjects[index]["Month"]),
              trailing: Column(
                children: [
                  const Text("Submission : "),
                  Icon(
                    Icons.verified,
                    color: (myProjects[index]["submission"] == true)
                        ? Colors.green
                        : Colors.grey,
                  )
                ],
              ),
              title: Text(myProjects[index]["Name"]),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailProjects(
                              mindex: index,
                              title: myProjects[index]["Name"],
                            )));
              },
            ),
          );
        });
  }
}
