
import 'package:flutter/material.dart';

import '../helpers/styling.dart';
import 'customText.dart';


class QuestionContainer extends StatelessWidget {
  final String hint;
  final String text;
  // final title;
  final iconOne;
  final iconTwo;
  final Color containerColor;
  final Color hintColor;
  // final TextEditingController controller;
  final bool obscure;
  final TextInputType textInputType;
  final TextAlign align;
  final double radius;
  final double topPadding;
  final InputBorder inputBorder;
  final int maxLines;
  // final double width;
  final validator;
  final onChanged;

  const QuestionContainer({
    Key key,
    this.hint = '',
    this.iconOne,
    this.iconTwo,
    this.containerColor = white,
    this.hintColor = grey,
    // required this.controller,
    this.obscure = false,
    this.textInputType = TextInputType.text,
    this.align = TextAlign.start,
    this.radius = 10,
    this.inputBorder = InputBorder.none,
    this.validator,
    this.maxLines = 1,
    this.onChanged,
    // required this.title,
    this.topPadding = 0, this.text='',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * .015),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5),
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width * .9,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(radius)),
              color: containerColor,
              boxShadow: [
                BoxShadow(
                  color: grey.withOpacity(.2),
                  blurRadius: 5,
                  spreadRadius: 2,
                  // offset: Offset(0, 5)
                ),
              ],
            ),
            child: Center(child: CustomText(text: text, textAlign: TextAlign.center,))
            //  TextFormField(
            //   maxLines: maxLines,
            //   textAlign: TextAlign.start,
            //   keyboardType: textInputType,
            //   obscureText: obscure,
            //   // validator: validator,
            //   onChanged: onChanged,
            //   controller: controller,
            //   style: TextStyle(color: darkPurple),
            //   cursorColor: primaryColor,
            //   decoration: InputDecoration(
            //     border: InputBorder.none,
            //     prefixIcon: iconOne, suffixIcon: iconTwo,
            //     hintText: hint,
            //     // labelText: hint,
            //     hintStyle: TextStyle(color: hintColor, fontSize: 16),
            //     contentPadding: EdgeInsets.only(
            //         // left: 9,
            //         top: topPadding),
            //   ),
            // ),
            ),
        SizedBox(height: MediaQuery.of(context).size.height * .01),
      ],
    );
  }
}
