// @dart=2.9

import 'package:flutter/services.dart';
import 'package:logistics/models/all_from_json.dart';

class AppServices {
  String response = '';
  Welcome welcome = Welcome();
  MenuInfo menuInfo = MenuInfo();
  PurchaseTypeSection purchaseTypeSection = PurchaseTypeSection();
  ProviderSection providerSection = ProviderSection();
  List<Product> products = <Product>[];
  Future<Welcome> getAllData() async {
    response = await rootBundle.loadString('assets/response_airtime.json');
    welcome = welcomeFromJson(response);
    return welcome;
  }

  Future<MenuInfo> readMenuInfo() async {
    await getAllData().whenComplete(() {
      menuInfo = welcome.data.menuInfo;
    });
    return menuInfo;
  }

  Future<PurchaseTypeSection> getPurchaseTypes() async {
    await getAllData().whenComplete(() {
      purchaseTypeSection = welcome.data.purchaseTypeSection;
    });
    return purchaseTypeSection;
  }

  Future<ProviderSection> getNetworkTypes() async {
    await getAllData().whenComplete(() {
      providerSection = welcome.data.providerSection;
    });
    return providerSection;
  }

  Future<List<Product>> getAvailableProducts() async {
    await getAllData().whenComplete(() {
      products = welcome.data.products;
    });
    return products;
  }
}
