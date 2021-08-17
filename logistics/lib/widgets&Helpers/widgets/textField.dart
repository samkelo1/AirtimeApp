import 'package:flutter/material.dart';

import '../helpers/styling.dart';
import 'customText.dart';

class LoginTextField extends StatelessWidget {
  final String hint;
  final iconOne;
  final iconTwo;
  final Color containerColor;
  final Color hintColor;
  final TextEditingController controller;
  final bool obscure;
  final TextInputType textInputType;
  final TextAlign align;
  final double radius;
  final InputBorder inputBorder;
  final int maxLines;
  final validator;

  const LoginTextField(
      {Key key,
      this.hint = '',
      this.iconOne,
      this.iconTwo,
      this.containerColor = white,
      this.hintColor = grey,
      @required this.controller,
      this.obscure = true,
      @required this.textInputType,
      this.align = TextAlign.center,
      this.radius = 12,
      this.inputBorder = InputBorder.none,
      this.validator,
      this.maxLines = 1})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 3),
        child: TextFormField(
          maxLines: maxLines,
          textAlign: align,
          keyboardType: textInputType,
          obscureText: obscure,
          validator: validator,
          controller: controller,
          style: TextStyle(color: Colors.black),
          cursorColor: Colors.black,
          decoration: InputDecoration(
            // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(radius ?? 15))),
            suffixIcon: iconTwo,
            prefixIcon: iconOne,
            labelText: hint,
            hintStyle: TextStyle(color: hintColor),
            // contentPadding: EdgeInsets.only(left: 9, top: 19),
          ),
        ),
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  final String hint;
  final title;
  final iconOne;
  final iconTwo;
  final Color containerColor;
  final Color hintColor;
  final TextEditingController controller;
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

  const SearchTextField({
    Key key,
    this.hint = '',
    this.iconOne,
    this.iconTwo,
    this.containerColor = white,
    this.hintColor = grey,
    @required this.controller,
    this.obscure = false,
    this.textInputType = TextInputType.text,
    this.align = TextAlign.start,
    this.radius = 10,
    this.inputBorder = InputBorder.none,
    this.validator,
    this.maxLines = 1,
    this.onChanged,
    @required this.title,
    this.topPadding = 0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontWeight: FontWeight.normal,
          color: darkPurple,
          textAlign: TextAlign.right,
          size: 17,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .015),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5),
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width * .9,
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
          child: TextFormField(
            maxLines: maxLines,
            textAlign: TextAlign.start,
            keyboardType: textInputType,
            obscureText: obscure,
            // validator: validator,
            onChanged: onChanged,
            controller: controller,
            style: TextStyle(color: darkPurple),
            cursorColor: primaryColor,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: iconOne, suffixIcon: iconTwo,
              hintText: hint,
              // labelText: hint,
              hintStyle: TextStyle(color: hintColor, fontSize: 16),
              contentPadding: EdgeInsets.only(
                  // left: 9,
                  top: topPadding),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .01),
      ],
    );
  }
}
