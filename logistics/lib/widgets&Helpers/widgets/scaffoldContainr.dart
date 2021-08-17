import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  final Widget child;
  final double horizontalPadding;
  final double verticalPadding;
  final double height;
  const CustomContainer({Key key, @required this.child, this.horizontalPadding = 0, this.verticalPadding = 0, @required this.height}) : super(key: key);

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widget.horizontalPadding,
        vertical: widget.verticalPadding,
      ),
      height:widget.height,
      width: MediaQuery.of(context).size.width,
      child: widget.child,
    );
  }
}


