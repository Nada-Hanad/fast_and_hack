import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:flutter/material.dart';

class SharpRoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double borderRadius;
  final double height;
  final double width;
  final Color textColor;

  const SharpRoundedButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.borderRadius,
      required this.height,
      required this.width,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        primary: beige,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ));
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: style,
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontFamily: 'MontserratMedium',
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
