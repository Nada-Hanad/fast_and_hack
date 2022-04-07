import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:fast_and_hack/src/auth/api_client.dart';
import 'package:fast_and_hack/src/screens/challenges.dart';
import 'package:fast_and_hack/src/screens/hifds_room.dart';
import 'package:fast_and_hack/src/screens/my_program.dart';
import 'package:fast_and_hack/src/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

class NavigatorPage extends StatefulWidget {
  final String accesstoken;

  const NavigatorPage(
      {Key? key, required this.title, required this.accesstoken})
      : super(key: key);
  final String title;
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  final List _children = [
    const MyProgramPage(),
    const HifdRoom(),
    const ChallengePage(),
    const ProfilePage(),
  ];
  late int currentIndex;
  final ApiClient _apiClient = ApiClient();

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
    Future<Map<String, dynamic>> getUserData() async {
      dynamic userRes;
      userRes = await _apiClient.getUserProfileData(widget.accesstoken);
      return userRes;
    }

    return Scaffold(
      backgroundColor: backGroundColor,
      body: _children[currentIndex], // new

      bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(30), topLeft: Radius.circular(30)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BubbleBottomBar(
              backgroundColor: const Color(0xFF3C5C7D),
              tilesPadding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              opacity: 1,
              currentIndex: currentIndex,
              onTap: changePage,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              elevation: 8,
              items: const <BubbleBottomBarItem>[
                BubbleBottomBarItem(
                    backgroundColor: beige,
                    icon: MyIcon(imagePath: "assets/images/planner.png"),
                    activeIcon:
                        MyIcon(imagePath: "assets/images/planner-active.png"),
                    title: Text("My program",
                        style: TextStyle(
                            color: backGroundColor,
                            fontFamily: 'MontserratMedium'))),
                BubbleBottomBarItem(
                    backgroundColor: beige,
                    icon: MyIcon(imagePath: "assets/images/rooms.png"),
                    activeIcon:
                        MyIcon(imagePath: "assets/images/rooms-active.png"),
                    title: Text("Hifdh's room",
                        style: TextStyle(
                            color: backGroundColor,
                            fontFamily: 'MontserratMedium'))),
                BubbleBottomBarItem(
                    backgroundColor: beige,
                    icon: MyIcon(imagePath: "assets/images/challenges.png"),
                    activeIcon: MyIcon(
                        imagePath: "assets/images/challenges-active.png"),
                    title: Text("Challenges",
                        style: TextStyle(
                            color: backGroundColor,
                            fontFamily: 'MontserratMedium'))),
                BubbleBottomBarItem(
                    backgroundColor: beige,
                    icon: MyIcon(imagePath: "assets/images/profile.png"),
                    activeIcon:
                        MyIcon(imagePath: "assets/images/profile-active.png"),
                    title: Text("Profile",
                        style: TextStyle(
                            color: backGroundColor,
                            fontFamily: 'MontserratMedium'))),
              ],
            ),
          )),
    );
  }
}

class MyIcon extends StatelessWidget {
  final String imagePath;

  const MyIcon({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 30,
      child: Image.asset(
        imagePath,
      ),
    );
  }
}
