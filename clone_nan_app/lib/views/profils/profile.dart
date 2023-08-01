import 'package:clone_nan_app/views/profils/payement.dart';
import 'package:flutter/material.dart';

class MainProfil extends StatefulWidget {
  const MainProfil({super.key});

  @override
  State<MainProfil> createState() => _MainProfilState();
}

class _MainProfilState extends State<MainProfil> with TickerProviderStateMixin {
  TabController? controller1;
  int index = 0;

  void tabListner() {
    index = controller1!.index;
  }

  @override
  void initState() {
    super.initState();
    controller1 = TabController(length: 2, vsync: this);
    controller1!.addListener(tabListner);
  }

  @override
  void dispose() {
    controller1!.removeListener(tabListner);
    controller1!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabarNavigation(tabController: controller1),
        Flexible(
          child: TabBarView(
            controller: controller1,
            children: [
              Abstract(),
              Payement(),
            ],
          ),
        )
      ],
    );
  }
}

class Abstract extends StatelessWidget {
  const Abstract({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: DrawerHeader(
              child: CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('assets/images/Profil.jpeg'),
          )),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: SizedBox(),
                ),
                Flexible(flex: 10, fit: FlexFit.tight, child: Text("Profils"))
              ],
            ),
            SizedBox(height: 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name : Welfare"),
                Text("Profil : Flutter's student"),
                Text("Status : Online"),
                Text("Total points: 100"),
                Text("Ranking: 14"),
              ],
            ),
            SizedBox(height: 15),
          ],
        ),
        const Divider(
          thickness: 0.5,
          indent: 15,
          endIndent: 15,
          height: 0.5,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: SizedBox(),
                ),
                Flexible(flex: 10, fit: FlexFit.tight, child: Text("Scolarity"))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Scolarity : You have paid 150000 FCFA"),
                Text("Remaining to be paid : 10000 FCFA"),
              ],
            )
          ],
        ),
        SizedBox(height: 15),
        Image.asset(
          "assets/images/qrCode.png",
          width: 90,
          height: 90,
        )
      ],
    );
  }
}

class TabarNavigation extends StatelessWidget {
  //TabBarNavigation of the Notes Attributions
  const TabarNavigation({
    super.key,
    required this.tabController,
  });

  final TabController? tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: tabController,
        isScrollable: false,
        labelPadding: const EdgeInsets.all(14.0),
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.black,
        automaticIndicatorColorAdjustment: true,
        labelColor: Colors.black,
        // indicator: BoxDecoration(
        //   color: Colors.black,
        //   borderRadius: BorderRadius.circular(15),
        // ),
        tabs: const [
          Text(
            "Abstract",
          ),
          Text("Payement"),
        ]);
  }
}
