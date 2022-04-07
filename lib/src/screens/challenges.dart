import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:fast_and_hack/src/custom_widgets/buttons/option_button.dart';
import 'package:fast_and_hack/src/custom_widgets/buttons/quizz_answer_button.dart';
import 'package:fast_and_hack/src/custom_widgets/buttons/rounded_button.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Widget> children = [
      Stack(
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
                          Text(
                            'Challenges',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'MontserratExtraBold',
                                color: beige),
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
                                'Up for a challenge! Choose from the challenges below to start',
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
                          onPressed: (() {
                            setState(() {
                              currentIndex = 1;
                            });
                          }),
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
      ),
      Stack(
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
                        height: height * 0.08,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Quizz',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontFamily: 'MontserratExtraBold',
                                color: beige),
                          ),
                        ],
                      ),
                      const Divider(
                        color: beige,
                        thickness: 1.5,
                      ),
                      SizedBox(
                        height: height * 0.08,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.8,
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                'Fill in the blank with the correct answer :',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'MontserratMedium',
                                    color: Color.fromARGB(255, 252, 245, 211)),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        width: width * 0.8,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: beige,
                        ),
                        child: const Text(
                          '“إِنَّ هَـٰذَا ٱلْقُرْءَانَ يَهْدِى لِلَّتِى هِىَ أَقْوَمُ وَيُبَشِّرُ ٱلْمُؤْمِنِينَ ٱلَّذِينَ يَعْمَلُونَ ----------- لَهُمْ أَجْرًۭا كَبِيرًۭا”',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'MontserratMedium',
                              color: backGroundColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              QuizzButton(
                                  onPressed: ((() {})),
                                  text: ' ٱلصَّـٰلِحَـٰتِ',
                                  borderRadius: 30.0,
                                  height: 40,
                                  width: width * 0.38,
                                  textColor: beige),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              QuizzButton(
                                  onPressed: ((() {})),
                                  text: '  ٱلصَّـٰلِحَـٰتِ أَنَّ',
                                  borderRadius: 30.0,
                                  height: 40,
                                  width: width * 0.38,
                                  textColor: beige),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.1,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SharpRoundedButton(
                                  onPressed: (() {}),
                                  text: 'Back',
                                  borderRadius: 30.0,
                                  height: 45,
                                  width: width * 0.3,
                                  textColor: backGroundColor),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              SharpRoundedButton(
                                  onPressed: (() {}),
                                  text: 'Next',
                                  borderRadius: 30.0,
                                  height: 45,
                                  width: width * 0.3,
                                  textColor: backGroundColor),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.end,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    ];

    return Scaffold(
        backgroundColor: backGroundColor, body: children[currentIndex]);
  }
}
