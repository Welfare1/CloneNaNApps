import 'package:clone_nan_app/views/home/home.dart';
import 'package:clone_nan_app/views/loginPage/login_page.dart';
import 'package:clone_nan_app/views/profils/profile.dart';
import 'package:clone_nan_app/views/projects/main_projects.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import '../courses/main_courses.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int indexPage = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
        body: SafeArea(
          child: [
            CountdownPage(),
            const MainCourses(),
            const MainProjects(),
            const MainProfil()
          ][indexPage],
        ),
        drawer: const Drawer(
          child: MyDrawer(),
        ),
        bottomNavigationBar: GNav(
            onTabChange: (index) {
              setState(() {
                indexPage = index;
              });
            },
            backgroundColor: Colors.white,
            // rippleColor: const Color.fromARGB(
            //     255, 242, 212, 247), // tab button ripple color when pressed
            hoverColor: Colors.grey[700]!, // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 15,
            //tabActiveBorder:
            //Border.all(color: Colors.white, width: 2), // tab button border
            // tabBorder:
            // Border.all(color: Colors.grey, width: 2), // tab button border
            // tabShadow: [
            //   BoxShadow(
            //     color: const Color.fromARGB(255, 242, 193, 251),
            //     // blurRadius: 8
            //   )
            // ], // tab button shadow
            curve: Curves.easeOutExpo, // tab animation curves
            duration:
                const Duration(milliseconds: 100), // tab animation duration
            gap: 5, // the tab button gap between icon and text
            color: Colors.purple.withOpacity(0.80), // unselected icon color
            activeColor: Colors.purple, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor:
                Colors.purple.withOpacity(0.1), // selected tab background color
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 10), // navigation bar padding
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.book,
                text: 'Courses',
              ),
              GButton(
                icon: LineIcons.file,
                text: 'Projects',
              ),
              GButton(
                icon: LineIcons.portrait,
                text: 'Profile',
              )
            ]),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Abstract(),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text("Login Out"))
      ],
    );
  }
}
