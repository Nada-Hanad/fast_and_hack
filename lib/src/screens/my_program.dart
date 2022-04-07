import 'package:avatar_glow/avatar_glow.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:fast_and_hack/src/custom_widgets/buttons/rounded_button.dart';
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
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                          fontFamily: 'MontserratMedium',
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
      const SpeechScreen(),
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

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({Key? key}) : super(key: key);

  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';
  //extract words of sentence in one array
  List<String> _extractWords(String text) {
    List<String> words = text.split(' ');
    return words;
  }

  //compare two arrays of strings and return an array with differences
  List<String> _compareWords(List<String> words1, List<String> words2) {
    List<String> diff = [];
    for (String word in words2) {
      if (!words1.contains(word)) {
        diff.add(word);
      }
    }
    return diff;
  }

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SharpRoundedButton(
              onPressed: () {
                List<String> firstSentence =
                    _extractWords('جمعيه بصمه جمعيه خيريه');
                print(firstSentence);

                List<String> secondSentence = _extractWords(_text);
                print(secondSentence);
                print(_compareWords(firstSentence, secondSentence));
              },
              text: 'Click me',
              borderRadius: 30,
              height: 60,
              width: 300,
              textColor: backGroundColor),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: Text(
              _text,
              style: const TextStyle(color: Colors.white, fontSize: 30),
            )),
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
    );
  }

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
}
