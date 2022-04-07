import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:fast_and_hack/src/auth/api_client.dart';
import 'package:fast_and_hack/src/custom_widgets/buttons/rounded_button.dart';
import 'package:fast_and_hack/src/screens/navigator.dart';
import 'package:flutter/material.dart';

class CollectData extends StatefulWidget {
  final String token;
  const CollectData({
    Key? key,
    required this.token,
  }) : super(key: key);

  @override
  State<CollectData> createState() => _CollectDataState();
}

class _CollectDataState extends State<CollectData> {
  final _apiClient = ApiClient();

  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    Future<void> _handleUpdate() async {
      //show snackbar to indicate loading
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      //the user data to be sent
      Map<String, dynamic> userData = {
        "StartTime": startTime,
        "EndTime": endTime,
      };

      //get response from ApiClient
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      dynamic res = await _apiClient.updateUser(
        userData,
        widget.token,
      );
      if (res['ErrorCode'] == null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NavigatorPage(
                      accesstoken: widget.token,
                      title: '',
                    )));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${res['Message']}'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }

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
              SharpRoundedButton(
                onPressed: _handleUpdate,
                text: 'Complete',
                borderRadius: 30,
                height: 60,
                width: 200,
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
