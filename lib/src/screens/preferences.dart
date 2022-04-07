import 'package:direct_select/direct_select.dart';
import 'package:fast_and_hack/src/custom_widgets/buttons/rounded_button.dart';
import 'package:fast_and_hack/src/screens/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:fast_and_hack/src/auth/api_client.dart';

import 'navigator.dart';

class SelectPage extends StatefulWidget {
  final String token;
  const SelectPage({
    Key? key,
    this.title,
    required this.token,
  }) : super(key: key);

  final String? title;

  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  final _apiClient = ApiClient();

  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  final elements1 = [
    "Jouz'",
    "Hizb",
    "Nisf",
    "Roub'e",
    "Thumun",
  ];
  final elements2 = [
    "Twice a week",
    "3 times a week",
    "4 times a week",
    "5 times a week",
    "6 times a week",
  ];

  int? selectedIndex1 = 0,
      selectedIndex2 = 0,
      selectedIndex3 = 0,
      selectedIndex4 = 0;

  List<Widget> _buildItems1() {
    return elements1
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }

  List<Widget> _buildItems2() {
    return elements2
        .map((val) => MySelectionItem(
              title: val,
            ))
        .toList();
  }

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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backGroundColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: height * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Center(
                      child: Text(
                        'Create new account',
                        style: TextStyle(
                            fontSize: 24.0,
                            fontFamily: 'MontserratBold',
                            color: beige),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.05),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "How much ?",
                    style: TextStyle(
                      color: beige,
                      fontSize: 20.0,
                      fontFamily: 'MontserratMedium',
                    ),
                  ),
                ),
                SizedBox(height: height * 0.05),
                DirectSelect(
                    itemExtent: 35.0,
                    selectedIndex: selectedIndex1!,
                    child: MySelectionItem(
                      isForList: false,
                      title: elements1[selectedIndex1!],
                    ),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedIndex1 = index;
                      });
                    },
                    items: _buildItems1()),
                SizedBox(height: height * 0.05),
                const Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Divider(
                    color: beige,
                    thickness: 1,
                  ),
                ),
                SizedBox(height: height * 0.02),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 20.0),
                  child: Text(
                    "How often ?",
                    style: TextStyle(
                      color: beige,
                      fontSize: 20.0,
                      fontFamily: 'MontserratMedium',
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                DirectSelect(
                    itemExtent: 35.0,
                    selectedIndex: selectedIndex2!,
                    child: MySelectionItem(
                      isForList: false,
                      title: elements2[selectedIndex2!],
                    ),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedIndex2 = index;
                      });
                    },
                    items: _buildItems2()),
                SizedBox(height: height * 0.05),
                const Padding(
                  padding: EdgeInsets.only(left: 50, right: 50),
                  child: Divider(
                    color: beige,
                    thickness: 1,
                  ),
                ),
                SizedBox(height: height * 0.03),
                const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Your free time ",
                    style: TextStyle(
                      color: beige,
                      fontSize: 20.0,
                      fontFamily: 'MontserratMedium',
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'From:  ',
                        style: TextStyle(
                          fontSize: 20.0,
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
                                  width: 1.0,
                                ),
                                bottom: BorderSide(
                                  color: beige,
                                  width: 1.0,
                                ),
                                left: BorderSide(
                                  color: beige,
                                  width: 1.0,
                                ),
                                right: BorderSide(
                                  color: beige,
                                  width: 1.0,
                                ),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              )),
                          child: Text(
                            '${startTime.hour}:${startTime.minute}',
                            style: const TextStyle(
                                color: beige,
                                fontFamily: "MontserratMedium",
                                fontSize: 18),
                          ),
                        ),
                      ),
                      const Text(
                        '  To:  ',
                        style: TextStyle(
                          fontSize: 20.0,
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
                                  width: 1.0,
                                ),
                                bottom: BorderSide(
                                  color: beige,
                                  width: 1.0,
                                ),
                                left: BorderSide(
                                  color: beige,
                                  width: 1.0,
                                ),
                                right: BorderSide(
                                  color: beige,
                                  width: 1.0,
                                ),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30.0),
                              )),
                          child: Text(
                            '${endTime.hour}:${endTime.minute}',
                            style: const TextStyle(
                                color: beige,
                                fontFamily: "MontserratMedium",
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.05),
                SharpRoundedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NavigatorPage(
                                    title: '',
                                    accesstoken: '',
                                  )));
                    },
                    text: 'Create account',
                    borderRadius: 30,
                    height: 60,
                    width: 180,
                    textColor: backGroundColor)
              ]),
        ),
      ),
    );
  }
}

//You can use any Widget
class MySelectionItem extends StatelessWidget {
  final String? title;
  final bool isForList;

  const MySelectionItem({Key? key, this.title, this.isForList = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * 0.06,
      child: isForList
          ? Padding(
              child: _buildItem(context),
              padding: const EdgeInsets.all(2.0),
            )
          : Card(
              color: backGroundColor,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: beige, width: 1),
                borderRadius: BorderRadius.circular(30),
              ),
              margin:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 60.0),
              child: Stack(
                children: <Widget>[
                  _buildItem(context),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.arrow_drop_up,
                      color: beige,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: beige,
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Widget _buildItem(BuildContext context) {
    return Container(
      color: backGroundColor,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: FittedBox(
          child: Text(
        title!,
        style: const TextStyle(
            fontFamily: 'MontserratRegular', color: beige, fontSize: 20),
      )),
    );
  }
}
