
import 'dart:convert';

import 'package:calory_tracker/model/model_nutrients.dart';

class Product {
  Product({
    required this.code,
    required this.imageUrl,
     this.nutriments,
    required this.productName,
    required this.servingSize,
  });

  final String code;
  final String imageUrl;
  final Nutriments? nutriments;
  final String productName;
  final String servingSize;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    code: json["code"],
    imageUrl: json["image_url"],
    nutriments: json["nutriments"] == null ? null : Nutriments.fromMap(json["nutriments"]),
    productName: json["product_name"],
    servingSize: json["serving_size"],
  );

  Map<String, dynamic> toMap() => {
    "code": code,
    "image_url": imageUrl,
    "nutriments": nutriments == null ? null : nutriments?.toMap(),
    "product_name": productName,
    "serving_size": servingSize,
  };
}