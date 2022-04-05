import 'package:flutter/material.dart';
import 'package:form_bloc/form_bloc.dart';
import 'package:fast_and_hack/myColors/my_colors.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: LoginForm(),
    );
  }
}

class LoginFormBloc extends FormBloc<String, String> {
  final email = TextFieldBloc<dynamic>(
    validators: [
      FieldBlocValidators.required,
      FieldBlocValidators.email,
    ],
  );

  final password = TextFieldBloc<dynamic>(
    validators: [
      FieldBlocValidators.required,
    ],
  );

  LoginFormBloc() {
    addFieldBlocs(
      fieldBlocs: [
        email,
        password,
      ],
    );
  }

  @override
  void onSubmitting() {
    print(email.value);
    print(password.value);
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backGroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height * 0.8,
          width: width * 0.8,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.8,
                  height: height * 0.2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Log In to your account",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'MontserratMedium',
                            color: beige),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hoverColor: beige,
                      hintStyle: TextStyle(
                          color: beige, fontFamily: 'MontserratMedium'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: beige, width: 2.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hoverColor: beige,
                      hintStyle: TextStyle(
                        color: beige,
                        fontFamily: 'MontserratMedium',
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: beige, width: 2.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirm password',
                        hoverColor: beige,
                        hintStyle: TextStyle(
                          color: beige,
                          fontFamily: 'MontserratMedium',
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: beige, width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      )),
                ),
                SizedBox(height: 20.0),
                GestureDetector(onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// class LoginForm extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => LoginFormBloc(),
//       child: Builder(
//         builder: (context) {
//           final loginFormBloc = context.read<LoginFormBloc>();

//           return Scaffold(
//             resizeToAvoidBottomInset: false,
//             appBar: AppBar(title: Text('Login')),
//             body: FormBlocListener<LoginFormBloc, String, String>(
//               onSubmitting: (context, state) {
//                 LoadingDialog.show(context);
//               },
//               onSuccess: (context, state) {
//                 LoadingDialog.hide(context);

//                 Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(builder: (_) => SuccessScreen()));
//               },
//               onFailure: (context, state) {
//                 LoadingDialog.hide(context);

//                 ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text(state.failureResponse!)));
//               },
//               child: SingleChildScrollView(
//                 physics: ClampingScrollPhysics(),
//                 child: AutofillGroup(
//                   child: Column(
//                     children: <Widget>[
//                       TextFieldBlocBuilder(
//                         textFieldBloc: loginFormBloc.email,
//                         keyboardType: TextInputType.emailAddress,
//                         autofillHints: [
//                           AutofillHints.username,
//                         ],
//                         decoration: InputDecoration(
//                           labelText: 'Email',
//                           prefixIcon: Icon(Icons.email),
//                         ),
//                       ),
//                       TextFieldBlocBuilder(
//                         textFieldBloc: loginFormBloc.password,
//                         suffixButton: SuffixButton.obscureText,
//                         autofillHints: [AutofillHints.password],
//                         decoration: InputDecoration(
//                           labelText: 'Password',
//                           prefixIcon: Icon(Icons.lock),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 250,
//                         child: CheckboxFieldBlocBuilder(
//                           booleanFieldBloc: loginFormBloc.showSuccessResponse,
//                           body: Container(
//                             alignment: Alignment.centerLeft,
//                             child: Text('Show success response'),
//                           ),
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: loginFormBloc.submit,
//                         child: Text('LOGIN'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

/*import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:fast_and_hack/src/custom_widgets/buttons/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backGroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: height * 0.8,
          width: width * 0.8,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.8,
                  height: height * 0.2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Log In to your account",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'MontserratMedium',
                            color: beige),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hoverColor: beige,
                      hintStyle: TextStyle(
                          color: beige, fontFamily: 'MontserratMedium'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: beige, width: 2.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hoverColor: beige,
                      hintStyle: TextStyle(
                        color: beige,
                        fontFamily: 'MontserratMedium',
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: beige, width: 2.0),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Confirm password',
                        hoverColor: beige,
                        hintStyle: TextStyle(
                          color: beige,
                          fontFamily: 'MontserratMedium',
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: beige, width: 2.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      )),
                ),
                SizedBox(height: 20.0),
                GestureDetector(onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}*/
