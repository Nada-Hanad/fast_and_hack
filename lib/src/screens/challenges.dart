import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:fast_and_hack/src/custom_widgets/buttons/log_out_button.dart';
import 'package:fast_and_hack/src/custom_widgets/buttons/option_button.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: backGroundColor,
        body: Stack(
          children: [
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.75,
              left: MediaQuery.of(context).size.width * 0.5,
              child: Image.asset(
                'assets/images/mainbg.png',
                height: 300,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.75,
              right: MediaQuery.of(context).size.width * 0.5,
              child: Image.asset(
                'assets/images/mainbg.png',
                height: 300,
              ),
            ),
            SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: width * 0.8,
                  height: height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Positioned(
                              child: Text(
                                'Challenges',
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontFamily: 'MontserratExtraBold',
                                    color: beige),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: beige,
                          thickness: 1.5,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: width * 0.8,
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  'Up for a challenge! Choose from the challenged below to start',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontFamily: 'MontserratThin',
                                      color: Colors.white),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.1,
                        ),
                        OptionButton(
                            onPressed: (() {}),
                            text: 'Quraan quizz',
                            borderRadius: 30,
                            height: height * 0.08,
                            width: width * 0.8,
                            textColor: beige),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        OptionButton(
                            onPressed: (() {}),
                            text: 'Hifdh competition',
                            borderRadius: 30,
                            height: height * 0.08,
                            width: width * 0.8,
                            textColor: beige),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        OptionButton(
                            onPressed: (() {}),
                            text: 'Hadeeth quiz',
                            borderRadius: 30,
                            height: height * 0.08,
                            width: width * 0.8,
                            textColor: beige)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
