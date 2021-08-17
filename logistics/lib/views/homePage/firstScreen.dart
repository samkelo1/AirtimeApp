import 'package:flutter/material.dart';
import 'package:logistics/views/homePage/homePage.dart';
import 'package:logistics/widgets&Helpers/helpers/changeScreen.dart';
import 'package:logistics/widgets&Helpers/helpers/styling.dart';
import 'package:logistics/widgets&Helpers/widgets/customText.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(onTap: ()=>changeScreen(context, HomePage()),
                  child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 15, left: 10, right: 10),
            child: Column(
              children: [
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomText(
                              text: 'AIRTIME',
                              color: white,
                              size: 16,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: white,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10,),   Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only( left: 10, right: 10),
          child: Column(
            children: [
              FittedBox(
                fit: BoxFit.fitWidth,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CustomText(
                            text: 'DATA BUNDLES',
                            color: white,
                            size: 16,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: white,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ],
    ));
  }
}
