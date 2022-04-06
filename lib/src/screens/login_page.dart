import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:fast_and_hack/src/auth/api_client.dart';
import 'package:fast_and_hack/src/custom_widgets/buttons/rounded_button.dart';
import 'package:fast_and_hack/src/custom_widgets/inputs/custom_input.dart';
import 'package:fast_and_hack/src/screens/navigator.dart';
import 'package:fast_and_hack/src/screens/register_account.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _apiClient = ApiClient();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

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
                      width: width * 0.8,
                      height: height * 0.15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(
                          child: Text(
                            'Log In to your account',
                            style: TextStyle(
                                fontSize: 24.0,
                                fontFamily: 'MontserratExtraBold',
                                color: beige),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    CustomInput(
                      hintText: "Email",
                      controller: emailController,
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    CustomInput(
                      hintText: "Password",
                      controller: passwordController,
                    ),
                    const SizedBox(height: 70.0),
                    SharpRoundedButton(
                      onPressed: loginUsers,
                      text: 'Log In',
                      borderRadius: 30,
                      height: 60,
                      width: width * 0.75,
                      textColor: Colors.black,
                    ),
                    const SizedBox(height: 50.0),
                    const Divider(
                      color: beige,
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(
                          child: Text(
                            'You dont have an account ?',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'MontserratMedium',
                                color: beige),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterPage()),
                              );
                            },
                            child: const Text(
                              'Create one now !',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  decoration: TextDecoration.underline,
                                  fontFamily: 'MontserratMedium',
                                  color: beige),
                            ),
                          ),
                        ),
                      ],
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

  Future<void> loginUsers() async {
    if (_formKey.currentState!.validate()) {
      //show snackbar to indicate loading
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));

      //get response from ApiClient
      dynamic res = await _apiClient.login(
        emailController.text,
        passwordController.text,
      );
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      //if there is no error, get the user's accesstoken and pass it to HomeScreen
      if (res['ErrorCode'] == null) {
        String accessToken = res['access_token'];
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NavigatorPage(
                      accesstoken: accessToken,
                      title: '',
                    )));
      } else {
        //if an error occurs, show snackbar with error message
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error: ${res['Message']}'),
          backgroundColor: Colors.red.shade300,
        ));
      }
    }
  }
}
