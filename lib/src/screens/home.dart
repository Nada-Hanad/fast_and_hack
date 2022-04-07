import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:fast_and_hack/src/custom_widgets/buttons/rounded_button.dart';
import 'package:fast_and_hack/src/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
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
          FadeIn(
            preferences: const AnimationPreferences(
              duration: Duration(milliseconds: 1500),
            ),
            child: Center(
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          Positioned(
            bottom: height * 0.5,
            left: width * 0.04,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BounceInUp(
                  preferences: const AnimationPreferences(
                    offset: Duration(milliseconds: 1450),
                  ),
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 50, left: 0),
                      child: Image.asset('assets/images/lantern.png')),
                ),
                BounceInUp(
                  preferences: const AnimationPreferences(
                    offset: Duration(milliseconds: 1600),
                  ),
                  child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 80, left: 30, right: 60),
                      child: Image.asset('assets/images/lantern.png'),
                      width: 50),
                ),
                BounceInUp(
                  preferences: const AnimationPreferences(
                    offset: Duration(milliseconds: 1400),
                  ),
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 120, left: 30),
                      child: Image.asset('assets/images/lantern.png'),
                      width: 70),
                ),
                BounceInUp(
                  preferences: const AnimationPreferences(
                    offset: Duration(milliseconds: 1500),
                  ),
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 0, left: 30),
                      child:
                          Image.asset('assets/images/lantern.png', width: 50)),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: SharpRoundedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  text: 'GET STARTED',
                  borderRadius: 11,
                  height: 60,
                  width: 350,
                  textColor: backGroundColor,
                ),
              ),
              SizedBox(
                height: height * 0.05,
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
