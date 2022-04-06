import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:fast_and_hack/src/screens/my_program.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  final List _children = [
    const MyProgramPage(),
    const PlaceholderWidget(Colors.deepOrange),
    const PlaceholderWidget(Colors.green),
    const PlaceholderWidget(Colors.indigo),
  ];
  late int currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      if (!(index == null)) {
        currentIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      body: _children[currentIndex], // new

      bottomNavigationBar: BubbleBottomBar(
        tilesPadding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        opacity: 1,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        items: const <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: beige,
              icon: MyIcon(imagePath: "assets/images/planner.png"),
              activeIcon: MyIcon(imagePath: "assets/images/planner.png"),
              title: Text("My program",
                  style: TextStyle(
                      color: backGroundColor, fontFamily: 'MontserratMedium'))),
          BubbleBottomBarItem(
              backgroundColor: beige,
              icon: MyIcon(imagePath: "assets/images/book.png"),
              activeIcon: MyIcon(imagePath: "assets/images/book.png"),
              title: Text("Hifdh's room",
                  style: TextStyle(
                      color: backGroundColor, fontFamily: 'MontserratMedium'))),
          BubbleBottomBarItem(
              backgroundColor: beige,
              icon: MyIcon(imagePath: "assets/images/challenges.png"),
              activeIcon: MyIcon(imagePath: "assets/images/challenges.png"),
              title: Text("Challenges",
                  style: TextStyle(
                      color: backGroundColor, fontFamily: 'MontserratMedium'))),
          BubbleBottomBarItem(
              backgroundColor: beige,
              icon: MyIcon(imagePath: "assets/images/profile.png"),
              activeIcon: MyIcon(imagePath: "assets/images/profile.png"),
              title: Text("Profile",
                  style: TextStyle(
                      color: backGroundColor, fontFamily: 'MontserratMedium'))),
        ],
      ),
    );
  }
}

class MyIcon extends StatelessWidget {
  final String imagePath;

  const MyIcon({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 25,
      child: Image.asset(
        imagePath,
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  const PlaceholderWidget(this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
