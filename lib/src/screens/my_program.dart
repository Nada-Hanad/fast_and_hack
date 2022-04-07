import 'dart:math';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:fast_and_hack/src/custom_widgets/buttons/icon_button.dart';
import 'package:fast_and_hack/src/custom_widgets/buttons/rounded_button.dart';
import 'package:fast_and_hack/src/custom_widgets/voice_widgets/visualizer.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class MyProgramPage extends StatelessWidget {
  const MyProgramPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(backgroundColor: backGroundColor, body: MyCalendar()));
  }
}

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  bool recordPlay = false;
  List<Widget> diffArray = [const Text('shit')];

  String _text = '';
  List<String> _extractWords(String text) {
    List<String> words = text.split(' ');
    return words;
  }

  List<String> _compareWords(List<String> words1, List<String> words2) {
    List<String> diff = [];
    for (int i = 0; min(words1.length, words2.length) > i; i++) {
      if (words1[i] != words2[i]) {
        diff.add(words1[i]);
      }
    }
    return diff;
  }

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    void _listen() async {
      if (!_isListening) {
        bool available = await _speech.initialize();
        if (available) {
          setState(() => _isListening = true);
          _speech.listen(
            localeId: 'ar-DZ',
            onResult: (val) => setState(() {
              _text = val.recognizedWords;
            }),
          );
        }
      } else {
        setState(() => _isListening = false);
        _speech.stop();
      }
    }

    final List _children = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF).withOpacity(0.15),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: const Text('Apr',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 50.0,
                          fontFamily: 'MontserratBold',
                          color: beige,
                        )),
                  ),
                  DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    height: MediaQuery.of(context).size.height * 0.1,
                    selectionColor: beige,
                    selectedTextColor: backGroundColor,
                    dateTextStyle: const TextStyle(
                      fontFamily: 'MontserratMedium',
                      color: beige,
                    ),
                    monthTextStyle: const TextStyle(
                      fontFamily: 'MontserratMedium',
                      color: beige,
                    ),
                    dayTextStyle: const TextStyle(
                      fontFamily: 'MontserratMedium',
                      color: beige,
                    ),
                    onDateChange: (date) {
                      // New date selected
                    },
                  ),
                ],
              ),
            ),
          ),
          const MyTasks(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          SharpRoundedButton(
            onPressed: () {
              setState(() {
                currentIndex = 1;
              });
            },
            text: 'Start now',
            borderRadius: 30,
            height: 60,
            width: MediaQuery.of(context).size.width * 0.65,
            textColor: backGroundColor,
          ),
        ],
      ),
      Scaffold(
        body: Stack(
          children: [
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.65,
              left: MediaQuery.of(context).size.width * 0.5,
              child: Image.asset(
                'assets/images/mainbg.png',
                height: 300,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.65,
              right: MediaQuery.of(context).size.width * 0.5,
              child: Image.asset(
                'assets/images/mainbg.png',
                height: 300,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 120.0,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: const Text(
                            'SOURAT EL BAKARA',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'MontserratMedium',
                              color: beige,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: const Text(
                            'AYA',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'MontserratMedium',
                              color: beige,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: const Text(
                            'JUZI',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'MontserratMedium',
                              color: beige,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                              child: _isListening
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: List<Widget>.generate(
                                          18,
                                          (index) => VoiceVisualizer(
                                              duration: [
                                                900,
                                                700,
                                                600,
                                                800,
                                                500,
                                                300,
                                                700,
                                                600,
                                                800,
                                                500,
                                                300,
                                                900,
                                                700,
                                                600,
                                                800,
                                                500,
                                                300,
                                                900,
                                                700,
                                              ][index],
                                              color: beige)),
                                    )
                                  : Container(),
                            ),
                            const Divider(
                              thickness: 1.0,
                              color: beige,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                _text.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = 2;
                                List<String> firstSentence =
                                    _extractWords('جمعيه بصمه جمعيه خيريه');

                                List<String> secondSentence =
                                    _extractWords(_text);
                                diffArray = [];
                                setState(() {
                                  for (var i = 0;
                                      i <
                                          _compareWords(
                                                  firstSentence, secondSentence)
                                              .length;
                                      i++) {
                                    diffArray.add(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Text(
                                            'Correct :',
                                            style: TextStyle(
                                              fontFamily: 'MontserratBold',
                                              fontSize: 20,
                                              color: beige,
                                            ),
                                          ),
                                          Text(
                                            _compareWords(firstSentence,
                                                secondSentence)[i],
                                            textAlign: TextAlign.start,
                                            style: const TextStyle(
                                              fontSize: 20.0,
                                              fontFamily: 'MontserratMedium',
                                              color: beige,
                                            ),
                                          ),
                                          const Text(
                                            'Yours :',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: beige,
                                              fontFamily: 'MontserratBold',
                                            ),
                                          ),
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  color: beige,
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                              ),
                                              const Icon(
                                                  Icons.play_arrow_rounded,
                                                  color: backGroundColor,
                                                  size: 30),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ));
                                  }
                                });
                              });
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SharpRoundedButton(
                                    onPressed: () {},
                                    text: '',
                                    borderRadius: 30,
                                    height: 60,
                                    width: 60,
                                    textColor: backGroundColor),
                                const Icon(Icons.done,
                                    color: backGroundColor, size: 25),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
        backgroundColor: backGroundColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: _isListening,
          glowColor: beige,
          endRadius: 75.0,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          child: FloatingActionButton(
            backgroundColor: beige,
            onPressed: _listen,
            child: Icon(
              _isListening ? Icons.mic : Icons.mic_none,
              color: backGroundColor,
            ),
          ),
        ),
      ),
      Scaffold(
        backgroundColor: backGroundColor,
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.65,
                left: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset(
                  'assets/images/mainbg.png',
                  height: 300,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.65,
                right: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset(
                  'assets/images/mainbg.png',
                  height: 300,
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 50.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Text(
                      'SOURAT EL BAKARA',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'MontserratBold',
                        color: beige,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Text(
                      'JUZI',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'MontserratBold',
                        color: beige,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: beige,
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0, right: 18),
                        child: Text(
                          'Your recording',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'MontserratMedium',
                            color: beige,
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: beige,
                      ),
                      Container(
                        color: beige,
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () => setState(() {
                                  recordPlay = !recordPlay;
                                }),
                            child: const Icon(Icons.mic_none,
                                color: beige, size: 30)),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.09,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Transform.scale(
                            scaleX: 0.7,
                            scaleY: 0.6,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                const Divider(
                                  thickness: 1.0,
                                  color: beige,
                                ),
                                recordPlay
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: List<Widget>.generate(
                                          18,
                                          (index) => VoiceVisualizer(
                                              duration: [
                                                900,
                                                700,
                                                600,
                                                800,
                                                500,
                                                300,
                                                700,
                                                600,
                                                800,
                                                500,
                                                300,
                                                900,
                                                700,
                                                600,
                                                800,
                                                500,
                                                300,
                                                900,
                                                700,
                                              ][index],
                                              color: beige),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: beige,
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 18.0, right: 18),
                        child: Text(
                          'Your mistakes',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'MontserratMedium',
                            color: beige,
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: beige,
                      ),
                      Container(
                        color: beige,
                        height: 1,
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(children: diffArray),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: beige,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              )),
                          onPressed: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Icon(
                                Icons.repeat_rounded,
                                color: backGroundColor,
                              ),
                              Text(
                                'Repeat',
                                style: TextStyle(
                                  color: backGroundColor,
                                  fontFamily: 'MontserratBold',
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconedButton(
                          text: 'Finish',
                          borderRadius: 30,
                          height: 60,
                          width: 150,
                          icon: Icons.done,
                          textColor: backGroundColor,
                          onPressed: () {}),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      )
    ];
    return Stack(
      children: [
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.65,
          left: MediaQuery.of(context).size.width * 0.5,
          child: Image.asset(
            'assets/images/mainbg.png',
            height: 300,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.65,
          right: MediaQuery.of(context).size.width * 0.5,
          child: Image.asset(
            'assets/images/mainbg.png',
            height: 300,
          ),
        ),
        _children[currentIndex],
      ],
    );
  }
}

class MyTasks extends StatefulWidget {
  const MyTasks({Key? key}) : super(key: key);

  @override
  State<MyTasks> createState() => _MyTasksState();
}

class _MyTasksState extends State<MyTasks> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Text(
              'Tasks',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'MontserratMedium',
                color: beige,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Text(
              'SOURAT EL BAKARA',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'MontserratMedium',
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Text(
              'AYA',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'MontserratMedium',
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: const Text(
              'JUZI',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'MontserratMedium',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
