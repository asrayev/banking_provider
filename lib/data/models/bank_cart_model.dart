// To parse this JSON data, do
//
//     final bankCart = bankCartFromJson(jsonString);

import 'dart:convert';

List<BankCart> bankCartFromJson(String str) => List<BankCart>.from(json.decode(str).map((x) => BankCart.fromJson(x)));

String bankCartToJson(List<BankCart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BankCart {
  BankCart({
    this.id,
    this.cardType,
    this.cardNumber,
    this.bankName,
    this.moneyAmount,
    this.cardCurrency,
    this.expireDate,
    this.iconImage,
    this.colors,
    this.cardCrrency,
  });

  int? id;
  String? cardType;
  String? cardNumber;
  String? bankName;
  double? moneyAmount;
  String? cardCurrency;
  DateTime? expireDate;
  String? iconImage;
  Colors? colors;
  String? cardCrrency;

  factory BankCart.fromJson(Map<String, dynamic> json) => BankCart(
    id: json["id"],
    cardType: json["card_type"],
    cardNumber: json["card_number"],
    bankName: json["bank_name"],
    moneyAmount: json["money_amount"],
    cardCurrency: json["card_currency"] == null ? null : json["card_currency"],
    expireDate: DateTime.parse(json["expire_date"]),
    iconImage: json["icon_image"],
    colors: Colors.fromJson(json["colors"]),
    cardCrrency: json["card_crrency"] == null ? null : json["card_crrency"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "card_type": cardType,
    "card_number": cardNumber,
    "bank_name": bankName,
    "money_amount": moneyAmount,
    "card_currency": cardCurrency == null ? null : cardCurrency,
    "expire_date": expireDate?.toIso8601String(),
    "icon_image": iconImage,
    "colors": colors!.toJson(),
    "card_crrency": cardCrrency == null ? null : cardCrrency,
  };
}

class Colors {
  Colors({
    this.colorA,
    this.colorB,
  });

  String? colorA;
  String? colorB;

  factory Colors.fromJson(Map<String, dynamic> json) => Colors(
    colorA: json["color_a"],
    colorB: json["color_b"],
  );

  Map<String, dynamic> toJson() => {
    "color_a": colorA,
    "color_b": colorB,
  };
}
