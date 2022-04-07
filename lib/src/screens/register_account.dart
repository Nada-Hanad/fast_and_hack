import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:fast_and_hack/src/auth/api_client.dart';
import 'package:fast_and_hack/src/custom_widgets/buttons/rounded_button.dart';
import 'package:fast_and_hack/src/custom_widgets/inputs/custom_input.dart';
import 'package:fast_and_hack/src/screens/data_collect.dart';
import 'package:fast_and_hack/src/screens/preferences.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _apiClient = ApiClient();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
              child: Form(
                key: _formKey,
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
                    CustomInput(
                      hintText: "Email",
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    CustomInput(
                      hintText: "Username",
                      controller: userNameController,
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    CustomInput(
                      controller: passwordController,
                      hintText: "Password",
                    ),
                    const SizedBox(height: 50.0),
                    CustomInput(
                      hintText: "Password",
                      controller: confirmPasswordController,
                    ),
                    const SizedBox(height: 50.0),
                    SharpRoundedButton(
                      onPressed: _handleRegister,
                      text: 'Continue',
                      borderRadius: 30,
                      height: 60,
                      width: width * 0.75,
                      textColor: backGroundColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      //show snackbar to indicate loading
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      //the user data to be sent
      Map<String, dynamic> userData = {
        "Email": [
          {
            "Type": "Primary",
            "Value": emailController.text,
          }
        ],
        "Password": passwordController.text,
        "FullName": userNameController.text,
      };

      //get response from ApiClient
      dynamic res = await _apiClient.registerUser(userData);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res['ErrorCode'] == null) {
        dynamic result = await _apiClient.login(
          emailController.text,
          passwordController.text,
        );
        if (result['ErrorCode'] == null) {
          String myAccessToken = result['access_token'];
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SelectPage(
                        token: myAccessToken,
                      )));
        } else {
          //if an error occurs, show snackbar with error message
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Error: ${result['Message']}'),
            backgroundColor: Colors.red.shade300,
          ));
        }
      } else {
        //if error is present, display a snackbar showing the error messsage
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${res['Description']}'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }
}
