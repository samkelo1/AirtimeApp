// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);


import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        this.data,
    });

    Data data;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.currentVersionNumber,
        this.menuInfo,
        this.purchaseTypeSection,
        this.providerSection,
        this.availableInputFields,
        this.availableDoneActions,
        this.products,
    });

    int currentVersionNumber;
    MenuInfo menuInfo;
    PurchaseTypeSection purchaseTypeSection;
    ProviderSection providerSection;
    List<AvailableInputField> availableInputFields;
    List<AvailableDoneAction> availableDoneActions;
    List<Product> products;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentVersionNumber: json["currentVersionNumber"],
        menuInfo: MenuInfo.fromJson(json["menuInfo"]),
        purchaseTypeSection: PurchaseTypeSection.fromJson(json["purchaseTypeSection"]),
        providerSection: ProviderSection.fromJson(json["providerSection"]),
        availableInputFields: List<AvailableInputField>.from(json["availableInputFields"].map((x) => AvailableInputField.fromJson(x))),
        availableDoneActions: List<AvailableDoneAction>.from(json["availableDoneActions"].map((x) => AvailableDoneAction.fromJson(x))),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "currentVersionNumber": currentVersionNumber,
        "menuInfo": menuInfo.toJson(),
        "purchaseTypeSection": purchaseTypeSection.toJson(),
        "providerSection": providerSection.toJson(),
        "availableInputFields": List<dynamic>.from(availableInputFields.map((x) => x.toJson())),
        "availableDoneActions": List<dynamic>.from(availableDoneActions.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class AvailableDoneAction {
    AvailableDoneAction({
        this.id,
        this.type,
        this.name,
        this.appendAmount,
        this.completeScreenTitle,
    });

    int id;
    int type;
    String name;
    bool appendAmount;
    String completeScreenTitle;

    factory AvailableDoneAction.fromJson(Map<String, dynamic> json) => AvailableDoneAction(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        appendAmount: json["appendAmount"],
        completeScreenTitle: json["completeScreenTitle"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "appendAmount": appendAmount,
        "completeScreenTitle": completeScreenTitle,
    };
}

class AvailableInputField {
    AvailableInputField({
        this.id,
        this.name,
        this.minDigitCount,
        this.maxDigitCount,
        this.description,
        this.inputType,
    });

    int id;
    String name;
    int minDigitCount;
    int maxDigitCount;
    String description;
    int inputType;

    factory AvailableInputField.fromJson(Map<String, dynamic> json) => AvailableInputField(
        id: json["id"],
        name: json["name"],
        minDigitCount: json["minDigitCount"] == null ? null : json["minDigitCount"],
        maxDigitCount: json["maxDigitCount"] == null ? null : json["maxDigitCount"],
        description: json["description"] == null ? null : json["description"],
        inputType: json["inputType"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "minDigitCount": minDigitCount == null ? null : minDigitCount,
        "maxDigitCount": maxDigitCount == null ? null : maxDigitCount,
        "description": description == null ? null : description,
        "inputType": inputType,
    };
}

class MenuInfo {
    MenuInfo({
        this.id,
        this.name,
        this.color,
        this.currency,
    });

    int id;
    String name;
    MenuInfoColor color;
    Currency currency;

    factory MenuInfo.fromJson(Map<String, dynamic> json) => MenuInfo(
        id: json["id"],
        name: json["name"],
        color: MenuInfoColor.fromJson(json["color"]),
        currency: Currency.fromJson(json["currency"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color.toJson(),
        "currency": currency.toJson(),
    };
}

class MenuInfoColor {
    MenuInfoColor({
        this.main,
        this.titleBar,
        this.secondary,
    });

    String main;
    String titleBar;
    String secondary;

    factory MenuInfoColor.fromJson(Map<String, dynamic> json) => MenuInfoColor(
        main: json["main"],
        titleBar: json["titleBar"],
        secondary: json["secondary"],
    );

    Map<String, dynamic> toJson() => {
        "main": main,
        "titleBar": titleBar,
        "secondary": secondary,
    };
}

class Currency {
    Currency({
        this.symbol,
        this.code,
        this.useSymbol,
    });

    String symbol;
    String code;
    bool useSymbol;

    factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        symbol: json["symbol"],
        code: json["code"],
        useSymbol: json["useSymbol"],
    );

    Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "code": code,
        "useSymbol": useSymbol,
    };
}

class Product {
    Product({
        this.purchaseTypeId,
        this.messages,
        this.providerId,
        this.doneActionId,
        this.preDefinedAmount,
        this.extraFields,
        this.productId,
    });

    int purchaseTypeId;
    List<Message> messages;
    int providerId;
    int doneActionId;
    PreDefinedAmount preDefinedAmount;
    List<ExtraField> extraFields;
    int productId;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        purchaseTypeId: json["purchaseTypeId"],
        messages: json["messages"] == null ? null : List<Message>.from(json["messages"].map((x) => messageValues.map[x])),
        providerId: json["providerId"] == null ? null : json["providerId"],
        doneActionId: json["doneActionId"],
        preDefinedAmount: json["preDefinedAmount"] == null ? null : PreDefinedAmount.fromJson(json["preDefinedAmount"]),
        extraFields: json["extraFields"] == null ? null : List<ExtraField>.from(json["extraFields"].map((x) => ExtraField.fromJson(x))),
        productId: json["productId"] == null ? null : json["productId"],
    );

    Map<String, dynamic> toJson() => {
        "purchaseTypeId": purchaseTypeId,
        "messages": messages == null ? null : List<dynamic>.from(messages.map((x) => messageValues.reverse[x])),
        "providerId": providerId == null ? null : providerId,
        "doneActionId": doneActionId,
        "preDefinedAmount": preDefinedAmount == null ? null : preDefinedAmount.toJson(),
        "extraFields": extraFields == null ? null : List<dynamic>.from(extraFields.map((x) => x.toJson())),
        "productId": productId == null ? null : productId,
    };
}

class ExtraField {
    ExtraField({
        this.jsonFieldName,
        this.inputFieldId,
        this.displayWhenComplete,
        this.preProcessorInputFieldId,
    });

    String jsonFieldName;
    int inputFieldId;
    bool displayWhenComplete;
    int preProcessorInputFieldId;

    factory ExtraField.fromJson(Map<String, dynamic> json) => ExtraField(
        jsonFieldName: json["jsonFieldName"],
        inputFieldId: json["inputFieldId"],
        displayWhenComplete: json["displayWhenComplete"] == null ? null : json["displayWhenComplete"],
        preProcessorInputFieldId: json["preProcessorInputFieldId"] == null ? null : json["preProcessorInputFieldId"],
    );

    Map<String, dynamic> toJson() => {
        "jsonFieldName": jsonFieldName,
        "inputFieldId": inputFieldId,
        "displayWhenComplete": displayWhenComplete == null ? null : displayWhenComplete,
        "preProcessorInputFieldId": preProcessorInputFieldId == null ? null : preProcessorInputFieldId,
    };
}

enum Message { DIAL_STRONG_13036213_STRONG, FOLLOWED_BY_THE_PIN_WITHOUT_ANY_SPACES, FOLLOWED_BY }

final messageValues = EnumValues({
    "Dial <strong>*130*3621*3*</strong>": Message.DIAL_STRONG_13036213_STRONG,
    "Followed by #": Message.FOLLOWED_BY,
    "Followed by the PIN without any spaces": Message.FOLLOWED_BY_THE_PIN_WITHOUT_ANY_SPACES
});

class PreDefinedAmount {
    PreDefinedAmount({
        this.fixedAmountItems,
        this.customAmountItem,
    });

    List<FixedAmountItem> fixedAmountItems;
    CustomAmountItem customAmountItem;

    factory PreDefinedAmount.fromJson(Map<String, dynamic> json) => PreDefinedAmount(
        fixedAmountItems: List<FixedAmountItem>.from(json["fixedAmountItems"].map((x) => FixedAmountItem.fromJson(x))),
        customAmountItem: json["customAmountItem"] == null ? null : CustomAmountItem.fromJson(json["customAmountItem"]),
    );

    Map<String, dynamic> toJson() => {
        "fixedAmountItems": List<dynamic>.from(fixedAmountItems.map((x) => x.toJson())),
        "customAmountItem": customAmountItem == null ? null : customAmountItem.toJson(),
    };
}

class CustomAmountItem {
    CustomAmountItem({
        this.sku,
        this.minAmountInCents,
        this.maxAmountInCents,
        this.description,
        this.message,
    });

    int sku;
    int minAmountInCents;
    int maxAmountInCents;
    String description;
    String message;

    factory CustomAmountItem.fromJson(Map<String, dynamic> json) => CustomAmountItem(
        sku: json["sku"],
        minAmountInCents: json["minAmountInCents"],
        maxAmountInCents: json["maxAmountInCents"],
        description: json["description"] == null ? null : json["description"],
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toJson() => {
        "sku": sku,
        "minAmountInCents": minAmountInCents,
        "maxAmountInCents": maxAmountInCents,
        "description": description == null ? null : description,
        "message": message == null ? null : message,
    };
}

class FixedAmountItem {
    FixedAmountItem({
        this.sku,
        this.amountInCents,
        this.message,
        this.isOffline,
        this.isPromo,
    });

    int sku;
    int amountInCents;
    String message;
    bool isOffline;
    bool isPromo;

    factory FixedAmountItem.fromJson(Map<String, dynamic> json) => FixedAmountItem(
        sku: json["sku"],
        amountInCents: json["amountInCents"],
        message: json["message"] == null ? null : json["message"],
        isOffline: json["isOffline"] == null ? null : json["isOffline"],
        isPromo: json["isPromo"] == null ? null : json["isPromo"],
    );

    Map<String, dynamic> toJson() => {
        "sku": sku,
        "amountInCents": amountInCents,
        "message": message == null ? null : message,
        "isOffline": isOffline == null ? null : isOffline,
        "isPromo": isPromo == null ? null : isPromo,
    };
}

class ProviderSection {
    ProviderSection({
        this.title,
        this.serviceProviders,
    });

    String title;
    List<ServiceProvider> serviceProviders;

    factory ProviderSection.fromJson(Map<String, dynamic> json) => ProviderSection(
        title: json["title"],
        serviceProviders: List<ServiceProvider>.from(json["serviceProviders"].map((x) => ServiceProvider.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "serviceProviders": List<dynamic>.from(serviceProviders.map((x) => x.toJson())),
    };
}

class ServiceProvider {
    ServiceProvider({
        this.id,
        this.name,
        this.icon,
        this.color,
        this.displayType,
        this.messages,
    });

    int id;
    String name;
    Icon icon;
    ServiceProviderColor color;
    int displayType;
    List<String> messages;

    factory ServiceProvider.fromJson(Map<String, dynamic> json) => ServiceProvider(
        id: json["id"],
        name: json["name"],
        icon: Icon.fromJson(json["icon"]),
        color: json["color"] == null ? null : ServiceProviderColor.fromJson(json["color"]),
        displayType: json["displayType"],
        messages: json["messages"] == null ? null : List<String>.from(json["messages"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon.toJson(),
        "color": color == null ? null : color.toJson(),
        "displayType": displayType,
        "messages": messages == null ? null : List<dynamic>.from(messages.map((x) => x)),
    };
}

class ServiceProviderColor {
    ServiceProviderColor({
        this.selected,
    });

    String selected;

    factory ServiceProviderColor.fromJson(Map<String, dynamic> json) => ServiceProviderColor(
        selected: json["selected"],
    );

    Map<String, dynamic> toJson() => {
        "selected": selected,
    };
}

class Icon {
    Icon({
        this.defaultIconName,
        this.selectedIconName,
    });

    String defaultIconName;
    String selectedIconName;

    factory Icon.fromJson(Map<String, dynamic> json) => Icon(
        defaultIconName: json["defaultIconName"],
        selectedIconName: json["selectedIconName"] == null ? null : json["selectedIconName"],
    );

    Map<String, dynamic> toJson() => {
        "defaultIconName": defaultIconName,
        "selectedIconName": selectedIconName == null ? null : selectedIconName,
    };
}

class PurchaseTypeSection {
    PurchaseTypeSection({
        this.title,
        this.purchaseTypes,
    });

    String title;
    List<PurchaseType> purchaseTypes;

    factory PurchaseTypeSection.fromJson(Map<String, dynamic> json) => PurchaseTypeSection(
        title: json["title"],
        purchaseTypes: List<PurchaseType>.from(json["purchaseTypes"].map((x) => PurchaseType.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "purchaseTypes": List<dynamic>.from(purchaseTypes.map((x) => x.toJson())),
    };
}

class PurchaseType {
    PurchaseType({
        this.id,
        this.name,
        this.displayType,
        this.completeOptions,
        this.doneActionId,
        this.iconName,
    });

    int id;
    String name;
    int displayType;
    List<int> completeOptions;
    int doneActionId;
    String iconName;

    factory PurchaseType.fromJson(Map<String, dynamic> json) => PurchaseType(
        id: json["id"],
        name: json["name"],
        displayType: json["displayType"],
        completeOptions: List<int>.from(json["completeOptions"].map((x) => x)),
        doneActionId: json["doneActionId"],
        iconName: json["iconName"] == null ? null : json["iconName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "displayType": displayType,
        "completeOptions": List<dynamic>.from(completeOptions.map((x) => x)),
        "doneActionId": doneActionId,
        "iconName": iconName == null ? null : iconName,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
