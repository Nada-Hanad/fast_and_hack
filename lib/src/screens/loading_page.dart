import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            color: backGroundColor,
            child: AnimatedBuilder(
              animation: animationController,
              child: SizedBox(
                height: width * 0.8,
                width: width * 0.8,
                child: const BackgroundImage(),
              ),
              builder: (BuildContext context, Widget? _widget) {
                return Transform.rotate(
                  angle: animationController.value * 6.3,
                  child: _widget,
                );
              },
            ),
          ),

          Column(

            children: [
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                  children: [
                    Image.asset(
                      'assets/images/coolicon.png',
                      height: 38,
                      width: 100,
                    ),
                  ],
                ),

              SizedBox(
                height: height * 0.04,
              ),
              Row(

                children: [
                  SizedBox(
                    width: width,
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Setting up your program ...',
                        style: TextStyle(
                            fontSize: 35.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            color: lightBeige),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      preferences: const AnimationPreferences(
        offset: Duration(milliseconds: 1500),
      ),
      child: Image.asset(
        'assets/images/mainbg.png',
      ),
    );
  }
}
