import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../helpers/styling.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final double letterSpacing;
  final Color color;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final int maxLines;
  final TextAlign textAlign;
  final String fontFamily;

  const CustomText({
    Key key,
    @required this.text,
    this.size = 14,
    this.color = black,
    this.fontWeight = FontWeight.bold,
    this.letterSpacing = .1,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
    this.fontFamily = 'Montserrat',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

class CartItemRich extends StatelessWidget {
  final String lightFont;
  final String boldFont;
  final double lightFontSize;
  final double boldFontSize;
  final double letterSpacing;
  final Color lightColor;
  final Color boldColor;
  final TextAlign textAlign;
  final FontWeight lightFontWeight;
  final FontWeight boldFontWeight;

  // final LongPressGestureRecognizer longPressGestureRecognizer;
  final VoidCallback callback;
  const CartItemRich({
    Key key,
    @required this.lightFont,
    @required this.boldFont,
    this.lightFontSize = 13,
    this.boldFontSize = 14,
    this.letterSpacing = .1,
    this.lightColor = Colors.grey,
    // required this.longPressGestureRecognizer,
    @required this.callback,
    this.textAlign = TextAlign.center,
    this.boldColor = darkPurple,
    this.lightFontWeight = FontWeight.bold,
    this.boldFontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: [
          TextSpan(
              text: lightFont,
              style: TextStyle(
                fontFamily: 'Montdserrat',
                color: lightColor,
                fontSize: lightFontSize,
                fontWeight: lightFontWeight,
              )),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = callback,
            text: boldFont,
            style: TextStyle(
              fontFamily: 'Montsderrat',
              color: boldColor,
              fontSize: boldFontSize,
              fontWeight: boldFontWeight,
              letterSpacing: letterSpacing,
            ),
          ),
        ],
      ),
    );
  }
}
