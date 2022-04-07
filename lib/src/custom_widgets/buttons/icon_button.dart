import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:flutter/material.dart';

class IconedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double borderRadius;
  final double height;
  final double width;
  final Color textColor;
  final IconData icon;

  const IconedButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.borderRadius,
      required this.height,
      required this.width,
      required this.textColor,
      required this.icon})
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
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontFamily: 'MontserratBold',
                fontSize: 20,
              ),
            ),
            Icon(
              icon,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
