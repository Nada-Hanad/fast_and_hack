import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:fast_and_hack/src/custom_widgets/buttons/rounded_button.dart';
import 'package:fast_and_hack/src/custom_widgets/inputs/custom_input.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backGroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: width * 0.8,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width,
                    height: height * 0.15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Create your account',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontFamily: 'MontserratMedium',
                            color: beige),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  const CustomInput(
                    hintText: "Email",
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const CustomInput(
                    hintText: "Username",
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const CustomInput(
                    hintText: "Password",
                  ),
                  const SizedBox(height: 50.0),
                  const CustomInput(
                    hintText: "Confirm password",
                  ),
                  const SizedBox(height: 50.0),
                  SharpRoundedButton(
                    onPressed: () {},
                    text: 'Continue',
                    borderRadius: 30,
                    height: 60,
                    width: width * 0.75,
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
