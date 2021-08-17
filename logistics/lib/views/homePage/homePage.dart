import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:logistics/models/all_from_json.dart' as fromJsonData;
import 'package:logistics/services/appServices.dart';
import 'package:logistics/widgets&Helpers/helpers/helperClass.dart';
import 'package:logistics/widgets&Helpers/helpers/styling.dart';
import 'package:logistics/widgets&Helpers/widgets/customText.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AppServices appServices = new AppServices();
  //menuInfoVariables
  String menuInfo = '';
  String currency = '';
  Color menuColor;
  Color scaffoldColor;
  //purchaseTypesVariables
  String type = '';
  String selectedType = '';
  int selectedTypeId = 0;
  List<fromJsonData.PurchaseType> purchaseTypes = [];
  //serviceProviderTypesVariables
  String title = '';
  String selectedProvidertitle = '';
  int providerTypeId = 0;
  List<fromJsonData.ServiceProvider> serviceProviders = [];
  //products and predefind amountItems
  List<fromJsonData.Product> products = [];
  List<fromJsonData.FixedAmountItem> fixedAmounts = [];
  fromJsonData.PreDefinedAmount preDefinedAmount = new fromJsonData.PreDefinedAmount();

  //custom amounts and cell input
  String customAmountToPay = '';
  double amountInCents = 0;
  List<int> dialpadNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  bool customAmount = false;
  bool cellPhoneNumberInput = false;

  bool showSummary = false;
  bool showSaleDone = false;
  double minCustomAmount = 0;
  double maxCustomAmount = 0;
  String cellPhoneNumber = '';
  bool quickSell = false;
  double availableCurrency = 4200;
  int currentDisplay = 0;
  @override
  void initState() {
    getMenuInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: scaffoldColor,
            appBar: AppBar(
              leadingWidth: 100,
              leading: InkWell(
                onTap: () {
                  if (currentDisplay == 0) {
                    Navigator.pop(context);
                  }
                  if (currentDisplay == 1) {
                    setState(() {
                      selectedType = '';
                      currentDisplay = 0;
                    });
                  }
                  if (currentDisplay == 2) {
                    setState(() {
                      currentDisplay = 1;
                      selectedProvidertitle = '';
                    });
                  }
                  if (currentDisplay == 3) {
                    setState(() {
                      amountInCents = 0;
                      currentDisplay = 2;
                    });
                  }
                  if (currentDisplay == 4) {
                    setState(() {
                      cellPhoneNumberInput = false;
                      cellPhoneNumber = '';
                      currentDisplay = 3;
                    });
                  }
                },
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Icon(Icons.arrow_back_ios, color: white, size: 17),
                    CustomText(text: 'Back', color: white, size: 15),
                  ],
                ),
              ),
              title: CustomText(text: menuInfo, color: white, size: 15, textAlign: TextAlign.center),
              actions: [
                Center(child: CustomText(text: currency + ' $availableCurrency', color: white, size: 15)),
                SizedBox(width: 10),
              ],
            ),
            body: Column(
              children: [
                firstScreen(),
                Visibility(visible: selectedType != '', child: secondScreen()),
                Visibility(visible: selectedProvidertitle != '', child: thirdScreen()),
                Visibility(visible: amountInCents > 0, child: fourthScreen()),
                Spacer(),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: black.withOpacity(.3),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CustomText(
                                    text: 'SELL',
                                    color: grey[400],
                                    size: 16,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: CustomText(
                                      text: '>>',
                                      color: grey[400],
                                      size: 20,
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
            ),
          ),
          Visibility(
              visible: showSummary == true,
              child: Scaffold(
                appBar: AppBar(
                  leadingWidth: 100,
                  leading: InkWell(
                    onTap: () {
                      setState(() {
                        showSummary = false;
                        cellPhoneNumber = '';
                      });
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(Icons.arrow_back_ios, color: white, size: 17),
                        CustomText(text: 'Back', color: white, size: 15),
                      ],
                    ),
                  ),
                  title: CustomText(text: menuInfo, color: white, size: 15, textAlign: TextAlign.center),
                  actions: [
                    Center(child: CustomText(text: currency + ' $availableCurrency', color: white, size: 15)),
                    SizedBox(width: 10),
                  ],
                ),
                body: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 80,
                      padding: EdgeInsets.only(
                        top: 15,
                        left: 15,
                        right: 15,
                      ),
                      child: Column(
                        children: [
                          FittedBox(
                            fit: BoxFit.fitWidth,
                            child: ClipPath(
                              clipper: PointsClipper(),
                              clipBehavior: Clip.hardEdge,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: CustomText(
                                              text: 'SUMMARY',
                                              color: black,
                                              size: 16,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: 'Type',
                                            color: grey[400],
                                            size: 16,
                                            textAlign: TextAlign.center,
                                          ),
                                          CustomText(
                                            text: selectedType,
                                            color: black,
                                            size: 16,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: 'Network',
                                            color: grey[400],
                                            size: 16,
                                            textAlign: TextAlign.center,
                                          ),
                                          CustomText(
                                            text: selectedProvidertitle,
                                            color: black,
                                            size: 16,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: 'Amount',
                                            color: grey[400],
                                            size: 16,
                                            textAlign: TextAlign.center,
                                          ),
                                          CustomText(
                                            text: '$currency ${amountInCents / 100}',
                                            color: black,
                                            size: 16,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(
                                            text: 'Cellphone Number',
                                            color: grey[400],
                                            size: 16,
                                            textAlign: TextAlign.center,
                                          ),
                                          CustomText(
                                            text: cellPhoneNumber,
                                            color: black,
                                            size: 16,
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showSaleDone = true;
                              });
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(top: 15, left: 0, right: 0),
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
                                                text: 'SELL',
                                                color: grey[400],
                                                size: 16,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child:  CustomText(
                                      text: '>>',
                                      color: grey[400],
                                      size: 20,
                                    ),
                                            )
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
                          SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Visibility(
            visible: customAmount == true,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: false,
                backgroundColor: black,
                title: CustomText(text: 'Enter Own Amount', color: white, size: 18),
                leading: IconButton(
                    onPressed: () {
                      setState(() {
                        customAmount = false;
                      });
                    },
                    icon: CustomText(text: 'X', size: 20, color: white, fontWeight: FontWeight.bold)),
              ),
              body: Container(
                color: grey[800],
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: CustomText(
                          text: '$currency $customAmountToPay',
                          color: customAmountToPay.length > 0 && customAmountToPay != '0' ? white : grey[700],
                          size: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        color: grey[800],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          children: [
                            GridView.builder(
                              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 6,
                                mainAxisSpacing: 6,
                                mainAxisExtent: 60,
                              ),
                              itemCount: dialpadNumbers.length,
                              itemBuilder: (BuildContext context, int index) {
                                var number = dialpadNumbers[index];
                                return GestureDetector(
                                  onTap: () {
                                    customAmountToPay = customAmountToPay + number.toString();

                                    print(customAmountToPay);
                                    setState(() {});
                                    // getPredefinedAmounts(selectedTypeId, providerTypeId);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(9)),
                                      alignment: Alignment.center,
                                      child: CustomText(
                                        text: '$number',
                                        size: 20,
                                        color: grey[900],
                                        fontWeight: FontWeight.bold,
                                      )),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 15,
                                right: 15,
                              ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print(customAmountToPay.length);
                                      // if (customAmountToPay.length != 1) {
                                      //   setState(() {});
                                      // }
                                      customAmountToPay = customAmountToPay.replaceAll(customAmountToPay.split('').last, '');

                                      setState(() {});
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: customAmountToPay == '' ? grey[300] : grey[500],
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      padding: const EdgeInsets.only(top: 17, left: 20, right: 20, bottom: 17),
                                      child: Icon(Icons.cancel),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      customAmountToPay = customAmountToPay + '.';

                                      setState(() {});
                                      print('.');
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      padding: const EdgeInsets.only(top: 17, left: 22, right: 22, bottom: 17),
                                      child: Center(child: CustomText(text: '.', size: 20, color: grey[900], fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      customAmountToPay = customAmountToPay + '0';

                                      setState(() {});
                                      print('0');
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      padding: const EdgeInsets.only(top: 17, left: 55, right: 55, bottom: 17),
                                      child: CustomText(text: '0', size: 20, color: grey[900], fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        if (customAmountToPay == '') {
                                          Fluttertoast.showToast(msg: 'the amount this field cannot be empty');
                                        } else if (double.parse(customAmountToPay) > maxCustomAmount) {
                                          Fluttertoast.showToast(msg: 'you can\'t exceed more than $maxCustomAmount');
                                        } else {
                                          setState(() {
                                            amountInCents = double.parse(customAmountToPay);
                                            customAmount = false;
                                            currentDisplay = 3;
                                          });
                                        }
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: lightGreen,
                                          borderRadius: BorderRadius.circular(9),
                                        ),
                                        padding: const EdgeInsets.only(top: 17, left: 20, right: 20, bottom: 17),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CustomText(text: 'DONE', size: 20, color: white, fontWeight: FontWeight.bold),
                                            Icon(Icons.arrow_forward_ios, color: white),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        color: grey[200],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: cellPhoneNumberInput == true,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: false,
                backgroundColor: black,
                title: CustomText(text: 'Enter Cell Phone Number', color: white, size: 18),
                leading: IconButton(
                    onPressed: () {
                      setState(() {
                        cellPhoneNumberInput = false;
                        cellPhoneNumber = '';
                      });
                    },
                    icon: CustomText(text: 'X', size: 20, color: white, fontWeight: FontWeight.bold)),
              ),
              body: Container(
                color: grey[800],
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: CustomText(
                          text: '${cellPhoneNumber ?? ''}',
                          color: cellPhoneNumber.length > 0 && cellPhoneNumber != '' ? white : grey[700],
                          size: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        color: grey[800],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          children: [
                            GridView.builder(
                              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 6,
                                mainAxisSpacing: 6,
                                mainAxisExtent: 60,
                              ),
                              itemCount: dialpadNumbers.length,
                              itemBuilder: (BuildContext context, int index) {
                                var number = dialpadNumbers[index];
                                return GestureDetector(
                                  onTap: () {
                                    cellPhoneNumber = cellPhoneNumber + number.toString();
                                    print(customAmountToPay);
                                    setState(() {});
                                    // getPredefinedAmounts(selectedTypeId, providerTypeId);
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(9)),
                                      alignment: Alignment.center,
                                      child: CustomText(
                                        text: '$number',
                                        size: 20,
                                        color: grey[900],
                                        fontWeight: FontWeight.bold,
                                      )),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                left: 15,
                                right: 15,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        if (cellPhoneNumber.length > 0) {
                                          cellPhoneNumber = cellPhoneNumber.replaceAll(cellPhoneNumber.split('').last, '');
                                        }

                                        setState(() {});
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: cellPhoneNumber == '' ? grey[300] : grey[500],
                                          borderRadius: BorderRadius.circular(9),
                                        ),
                                        padding: const EdgeInsets.only(top: 17, left: 20, right: 20, bottom: 17),
                                        child: Icon(Icons.cancel),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      cellPhoneNumber = cellPhoneNumber + '0';
                                      setState(() {});
                                      print('0');
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: white,
                                        borderRadius: BorderRadius.circular(9),
                                      ),
                                      padding: const EdgeInsets.only(top: 17, left: 55, right: 55, bottom: 17),
                                      child: CustomText(text: '0', size: 20, color: grey[900], fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        if (cellPhoneNumber.length != 10) {
                                          Fluttertoast.showToast(msg: 'invalid phone number');
                                        } else {
                                          setState(() {
                                            cellPhoneNumberInput = false;
                                            showSummary = true;
                                          });
                                        }
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: lightGreen,
                                          borderRadius: BorderRadius.circular(9),
                                        ),
                                        padding: const EdgeInsets.only(top: 17, left: 20, right: 20, bottom: 17),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            CustomText(text: 'DONE', size: 20, color: white, fontWeight: FontWeight.bold),
                                            Icon(Icons.arrow_forward_ios, color: white),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        color: grey[200],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
              visible: showSaleDone == true,
              child: Scaffold(
                backgroundColor: lightGreen,
                body: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                                child: CustomText(
                                  text: 'SALE COMPLETE',
                                  color: black,
                                  size: 16,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                                    child: Row(
                                      children: [
                                        CustomText(
                                          text: 'Cell Phone Number',
                                          color: grey[400],
                                          size: 16,
                                          textAlign: TextAlign.center,
                                        ),
                                        Spacer(),
                                        CustomText(
                                          text: cellPhoneNumber,
                                          color: black,
                                          size: 16,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(shape: BoxShape.circle, color: lightGreen),
                                          child: Icon(
                                            Icons.add,
                                            color: white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                                    child: Row(
                                      children: [
                                        CustomText(
                                          text: 'Your Sale',
                                          color: grey[400],
                                          size: 16,
                                          textAlign: TextAlign.center,
                                        ),
                                        Spacer(),
                                        CustomText(
                                          text: selectedProvidertitle,
                                          color: black,
                                          size: 16,
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(width: 10),
                                        CustomText(
                                          text: selectedType,
                                          color: black,
                                          size: 16,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                                    child: Row(
                                      children: [
                                        CustomText(
                                          text: 'Total',
                                          color: grey[400],
                                          size: 16,
                                          textAlign: TextAlign.center,
                                        ),
                                        Spacer(),
                                        CustomText(
                                          text: currency + ' ${amountInCents / 100}',
                                          color: black,
                                          size: 16,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(top: 13, left: 15, right: 15),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.receipt),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomText(
                                      text: 'ADD TO QUICK SELL',
                                      color: black,
                                      size: 16,
                                      textAlign: TextAlign.center,
                                    ),
                                    Spacer(),
                                    CupertinoSwitch(
                                        value: quickSell,
                                        onChanged: (val) {
                                          quickSell = val;
                                          setState(() {});
                                        })
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              showSaleDone = false;
                              showSummary = false;
                              selectedType = '';
                              amountInCents = 0;
                              selectedProvidertitle = '';
                              cellPhoneNumber = '';
                              currentDisplay = 0;
                            });
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(top: 13, left: 15, right: 15),
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 10),
                                  child: Row(
                                    children: [
                                      Icon(Icons.refresh),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CustomText(
                                        text: 'SELL AGAIN',
                                        color: black,
                                        size: 16,
                                        textAlign: TextAlign.center,
                                      ),
                                      Spacer(),
                                      Icon(Icons.arrow_forward_ios)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(top: 13, left: 15, right: 15),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.print),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomText(
                                      text: 'REPRINT',
                                      color: black,
                                      size: 16,
                                      textAlign: TextAlign.center,
                                    ),
                                    Spacer(),
                                    Icon(Icons.arrow_forward_ios)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(top: 13, left: 15, right: 15),
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 22.0, horizontal: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.share),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomText(
                                      text: 'SHARE',
                                      color: black,
                                      size: 16,
                                      textAlign: TextAlign.center,
                                    ),
                                    Spacer(),
                                    Icon(Icons.arrow_forward_ios)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 20,
                      top: 10,
                      child: Container(
                          decoration: BoxDecoration(color: black, shape: BoxShape.circle),
                          child: IconButton(
                            color: white,
                            onPressed: () {
                              setState(() {
                                showSaleDone = false;
                                showSummary = false;
                                selectedType = '';
                                amountInCents = 0;
                                selectedProvidertitle = '';
                                cellPhoneNumber = '';
                                currentDisplay = 0;
                              });
                            },
                            icon: CustomText(
                              text: 'X',
                              size: 22,
                              color: white,
                            ),
                          )),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget firstScreen() {
    if (selectedType == '') {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: type,
                            color: grey[400],
                            size: 16,
                          ),
                          Icon(
                            Icons.remove,
                            color: grey[400],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      color: grey[400],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: grey[400],
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            mainAxisExtent: 150,
                          ),
                          itemCount: purchaseTypes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                print(purchaseTypes[index].name);
                                setState(() {
                                  selectedType = purchaseTypes[index].name;
                                  selectedTypeId = purchaseTypes[index].id;
                                  currentDisplay = 1;
                                });
                              },
                              child: Container(
                                color: white,
                                alignment: Alignment.center,
                                child: purchaseTypes[index].displayType == 1
                                    ? CustomText(
                                        text: purchaseTypes[index].name,
                                        size: 18,
                                        color: grey[900],
                                        fontWeight: FontWeight.bold,
                                      )
                                    : Image.asset(HelperClass.baseImageUrl + purchaseTypes[index].iconName + '.png'),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: type,
                        color: grey[400],
                        size: 16,
                      ),
                      selectedType == ''
                          ? Icon(
                              Icons.remove,
                              color: grey[400],
                            )
                          : CustomText(
                              text: selectedType,
                              color: black,
                              size: 16,
                            ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  Widget secondScreen() {
    if (selectedProvidertitle == '') {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: title,
                            color: grey[400],
                            size: 16,
                          ),
                          Icon(
                            Icons.remove,
                            color: grey[400],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      color: grey[400],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: grey[400],
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            mainAxisExtent: 150,
                          ),
                          itemCount: serviceProviders.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                print(serviceProviders[index].name);
                                setState(() {
                                  selectedProvidertitle = serviceProviders[index].name;
                                  providerTypeId = serviceProviders[index].id;
                                  currentDisplay = 2;
                                });
                                getPredefinedAmounts(selectedTypeId, providerTypeId);
                              },
                              child: Container(
                                color: white,
                                alignment: Alignment.center,
                                child: serviceProviders[index].displayType == 1
                                    ? CustomText(
                                        text: purchaseTypes[index].name,
                                        size: 18,
                                        color: grey[900],
                                        fontWeight: FontWeight.bold,
                                      )
                                    : Image.asset(
                                        HelperClass.baseImageUrl + serviceProviders[index].icon.defaultIconName + '.png',
                                        fit: BoxFit.scaleDown,
                                      ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: title,
                        color: grey[400],
                        size: 16,
                      ),
                      selectedProvidertitle == ''
                          ? Icon(
                              Icons.remove,
                              color: grey[400],
                            )
                          : CustomText(
                              text: selectedProvidertitle,
                              color: black,
                              size: 16,
                            ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  Widget thirdScreen() {
    if (amountInCents == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Amount',
                            color: grey[400],
                            size: 16,
                          ),
                          Icon(
                            Icons.remove,
                            color: grey[400],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      color: grey[400],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: grey[400],
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                        child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            mainAxisExtent: 80,
                          ),
                          itemCount: fixedAmounts.length,
                          itemBuilder: (BuildContext context, int index) {
                            var predef = fixedAmounts[index];
                            return GestureDetector(
                              onTap: () {
                                print(predef.amountInCents);
                                setState(() {
                                  amountInCents = predef.amountInCents.toDouble();
                                  currentDisplay = 3;
                                });
                                print(minCustomAmount);
                              },
                              child: Container(
                                  color: white,
                                  alignment: Alignment.center,
                                  child: CustomText(
                                    text: '$currency ${predef.amountInCents / 100}',
                                    size: 18,
                                    color: grey[900],
                                    fontWeight: FontWeight.bold,
                                  )),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      color: grey[400],
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          minCustomAmount = preDefinedAmount.customAmountItem.minAmountInCents / 100 ?? 1.0;
                          maxCustomAmount = preDefinedAmount.customAmountItem.maxAmountInCents / 100 ?? 1.0;
                          customAmount = true;
                        });
                        print(minCustomAmount ?? 0);
                        print(maxCustomAmount ?? 0);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                        child: Column(
                          children: [
                            FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                                  child: CustomText(
                                    text: 'SELECT OWN AMOUNT',
                                    color: grey[900],
                                    size: 20,
                                    textAlign: TextAlign.center,
                                    letterSpacing: .5,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Amount',
                        color: grey[400],
                        size: 16,
                      ),
                      amountInCents == 0
                          ? Icon(
                              Icons.remove,
                              color: grey[400],
                            )
                          : CustomText(
                              text: '$currency ${amountInCents / 100}',
                              color: black,
                              size: 16,
                            ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

  Widget fourthScreen() {
    return GestureDetector(
      onTap: () {
        cellPhoneNumberInput = true;
        setState(() {});
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Cell Phone Number',
                        color: grey[400],
                        size: 16,
                      ),
                      Icon(Icons.arrow_forward_ios)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getMenuInfo() async {
    fromJsonData.MenuInfo menuInformation = await appServices.readMenuInfo();
    menuInfo = menuInformation.name;
    currency = menuInformation.currency.symbol;
    menuColor = Color(int.parse('0xff' + menuInformation.color.titleBar.replaceAll('#', '')));
    scaffoldColor = Color(int.parse('0xff' + menuInformation.color.main.replaceAll('#', '')));
    getPurchaseTypeInformation();
    getNetworkTypeInformation();
    setState(() {});
  }

  getPurchaseTypeInformation() async {
    fromJsonData.PurchaseTypeSection purchaseTypeSection = await appServices.getPurchaseTypes();
    type = purchaseTypeSection.title;
    purchaseTypes = purchaseTypeSection.purchaseTypes;
  }

  getNetworkTypeInformation() async {
    fromJsonData.ProviderSection serviceProvider = await appServices.getNetworkTypes();
    title = serviceProvider.title;
    serviceProviders = serviceProvider.serviceProviders;
  }

  getPredefinedAmounts(int selectedTypeId, int selectedProviderId) async {
    List<fromJsonData.Product> availableProducts = await appServices.getAvailableProducts();
    availableProducts.forEach((element) {
      // print(element.providerId);
      // print(element.purchaseTypeId);
      if (element.providerId == selectedProviderId && element.purchaseTypeId == selectedTypeId) {
        print('KNKFVNS');
        setState(() {
          preDefinedAmount = element.preDefinedAmount;
          fixedAmounts = preDefinedAmount.fixedAmountItems;
        });
      }
    });
  }
}
