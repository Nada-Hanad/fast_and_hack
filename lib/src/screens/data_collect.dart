import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:flutter/material.dart';

class CollectData extends StatefulWidget {
  const CollectData({Key? key}) : super(key: key);

  @override
  State<CollectData> createState() => _CollectDataState();
}

class _CollectDataState extends State<CollectData> {
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backGroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Select your time',
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'MontserratMedium',
                  color: beige,
                ),
              ),
              const SizedBox(
                height: 60.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'From:  ',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'MontserratMedium',
                        color: beige,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: startTime,
                          initialEntryMode: TimePickerEntryMode.dial,
                        );
                        if (timeOfDay != null && timeOfDay != startTime) {
                          setState(() {
                            startTime = timeOfDay;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 10, right: 10, bottom: 5),
                        decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: beige,
                                width: 2.0,
                              ),
                              bottom: BorderSide(
                                color: beige,
                                width: 2.0,
                              ),
                              left: BorderSide(
                                color: beige,
                                width: 2.0,
                              ),
                              right: BorderSide(
                                color: beige,
                                width: 2.0,
                              ),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            )),
                        child: Text(
                          '${startTime.hour}:${startTime.minute}',
                          style: const TextStyle(
                              color: beige,
                              fontFamily: "MontserratMedium",
                              fontSize: 25),
                        ),
                      ),
                    ),
                    const Text(
                      '  To:  ',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontFamily: 'MontserratMedium',
                        color: beige,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final TimeOfDay? timeOfDay = await showTimePicker(
                          context: context,
                          initialTime: endTime,
                          initialEntryMode: TimePickerEntryMode.dial,
                        );
                        if (timeOfDay != null && timeOfDay != endTime) {
                          setState(() {
                            endTime = timeOfDay;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 5.0, left: 10, right: 10, bottom: 5),
                        decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: beige,
                                width: 2.0,
                              ),
                              bottom: BorderSide(
                                color: beige,
                                width: 2.0,
                              ),
                              left: BorderSide(
                                color: beige,
                                width: 2.0,
                              ),
                              right: BorderSide(
                                color: beige,
                                width: 2.0,
                              ),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            )),
                        child: Text(
                          '${endTime.hour}:${endTime.minute}',
                          style: const TextStyle(
                              color: beige,
                              fontFamily: "MontserratMedium",
                              fontSize: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
