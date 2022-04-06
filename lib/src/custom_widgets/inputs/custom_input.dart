import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const CustomInput(
      {Key? key, required this.hintText, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool obsecureText;
    if (hintText == "Password") {
      obsecureText = true;
    } else {
      obsecureText = false;
    }
    return Padding(
      padding: const EdgeInsets.all(0),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          color: beige,
          fontFamily: 'MontserratMedium',
        ),
        obscureText: obsecureText,
        decoration: InputDecoration(
          hintText: hintText,
          hoverColor: lightBeige,
          hintStyle: const TextStyle(
            color: lightBeige,
            fontFamily: 'MontserratMedium',
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: lightBeige, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: lightBeige, width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
