import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:flutter/material.dart';

class MyProgramPage extends StatelessWidget {
  const MyProgramPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      backgroundColor: backGroundColor,
      body: Center(
          child: Text(
        'My program',
      )),
    ));
  }
}
