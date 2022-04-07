import 'package:fast_and_hack/myColors/my_colors.dart';
import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double borderRadius;
  final double height;
  final double width;
  final Color textColor;

  const OptionButton(
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
        primary: lightBlue,
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
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontFamily: 'MontserratMedium',
                  fontSize: 20,
                ),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: beige,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}
