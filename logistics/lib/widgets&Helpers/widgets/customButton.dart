import 'package:flutter/material.dart';

import '../helpers/styling.dart';
import 'customText.dart';

class CustomFlatButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Color iconColor;
  final VoidCallback callback;
  // final ShapeBorder shape;
  final double height;
  final double width;
  final double radius;
  final double iconSize;
  final icon;
  final double fontSize;
  final FontWeight fontWeight;

  const CustomFlatButton(
      {Key key,
      @required this.text,
      this.color = darkPurple,
      @required this.callback,
      this.textColor = black,
      this.height = 45,
      this.width = 200,
      this.radius = 10,
      this.icon,
      this.fontSize = 14,
      this.iconColor = black,
      this.iconSize = 14,
      this.fontWeight = FontWeight.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: GestureDetector(
        onTap: callback,
        
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * .9,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            color: color,
            boxShadow: [
              BoxShadow(color: grey.withOpacity(.4), blurRadius: 4, spreadRadius: 1),
            ],
          ),
          child: CustomText(
            text: text,
            color: textColor,
            size: fontSize,
            fontWeight: fontWeight,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );

    //   MaterialButton(
    //     focusElevation: 6,
    //     elevation: 7,
    //     height: height ,
    //     minWidth: width ,
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius))),
    //     onPressed: callback,
    //     color: color ,
    //     child: Container(
    //       width: width ,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           icon == null
    //               ? SizedBox.shrink()
    //               : Icon(
    //                   icon,
    //                   color: textColor,
    //                   size: iconSize ,
    //                 ),
    //           SizedBox(
    //             width: 5,
    //           ),
    //           FittedBox(
    //             fit: BoxFit.scaleDown,
    //             child: CustomText(
    //               text: text,
    //               color: textColor,
    //               size: fontSize,
    //               fontWeight: fontWeight,
    //               overflow: TextOverflow.ellipsis,
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
