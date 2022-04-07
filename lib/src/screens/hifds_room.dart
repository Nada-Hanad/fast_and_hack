import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:fast_and_hack/src/custom_widgets/buttons/join_button.dart';
import 'package:fast_and_hack/src/custom_widgets/buttons/show_more_button.dart';

class HifdRoom extends StatefulWidget {
  const HifdRoom({Key? key}) : super(key: key);

  @override
  _HifdRoomState createState() => _HifdRoomState();
}

class _HifdRoomState extends State<HifdRoom> {


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
                                'Hifds room',
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
                                  'Here you can find rooms to interact with other people who share the same goal as you do.',
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
                          height: height * 0.05,
                        ),

                        SizedBox(
                          height: height * 0.02,
                        ),
                        Column(
                          children: <Widget>[
                          _buildCard(),
                          ],
                        ),

                        SizedBox(
                          height: height * 0.02,
                        ),
                        Column(
                          children: <Widget>[
                            _buildCard(),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Column(
                         children: [
                           ShowMoreButton (
                               onPressed: (() {}),
                               text: 'Show more',
                               borderRadius: 30,
                               height: height * 0.04,
                               width: width * 0.45,
                               textColor: backGroundColor
                           ),
                         ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
  Card _buildCard ()
  {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 4.0,
      color: Color(0xFF496887),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        height: 180,
        width: 360,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0, top: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildImageBlock(),
            _buildSuraBlock(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                JoinButton(
                    onPressed: (() {}),
                    text: 'JOIN NOW',
                    borderRadius: 30,
                    height: height * 0.04,
                    width: width * 0.35,
                    textColor: backGroundColor
                ),
              ],
            ),
          ],

        ),
      ),

    );
  }
  Row _buildImageBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(5, 0, 15, 0),
          child:
            Image.asset(
              "assets/images/people.png",
              height: 58,
              width: 52,

            ),
        ),
        Text(
          "ROOM 1",
          style: TextStyle(
              color: beige,
              fontSize: 22,
              fontFamily: 'Montserrat'),

        ),
      ],
    );
  }
  Row _buildSuraBlock(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            "ST AL-BAKARA",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Montserrat',

              background: Paint ()
                ..strokeWidth = 19
                ..color = backGroundColor
                ..strokeJoin = StrokeJoin.round
                ..style = PaintingStyle.stroke,
            ),
          ),
          Text(
            "AYA 22",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Montserrat',
              background: Paint ()
                ..strokeWidth = 19
                ..color = backGroundColor
                ..strokeJoin = StrokeJoin.round
                ..style = PaintingStyle.stroke
                //..shader =
              ,),
          ),
          Text(
            "JUZI 1",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Montserrat',
              background: Paint ()
                ..strokeWidth = 19
                ..color = backGroundColor
                ..strokeJoin = StrokeJoin.round
                ..style = PaintingStyle.stroke,),
          ),
        ],

    );
  }
}
