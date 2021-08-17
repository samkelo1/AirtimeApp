
import 'package:flutter/material.dart';

changeScreen(BuildContext context, Widget widget) {
  Navigator.push(context, ScaleRoute(page:  widget));
}
changeScaleScreen(BuildContext context, Widget widget) {
  Navigator.push(context, ScaleRoute(page:  widget));
}
void changeScreenReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(context, ScaleRoute(page: widget));
}

class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({@required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}
