

import 'package:calory_tracker/model/model_nutrients.dart';

class Product {
  Product({
    this.code,
    this.imageUrl,
    required this.nutriments,
    this.productName,
    this.servingSize,
  });

  final String? code;
  final String? imageUrl;
  final Nutriments? nutriments;
  final String? productName;
  final String? servingSize;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    code: json["code"],
    imageUrl: json["image_url"] == null ? null : json["image_url"],
    nutriments: json["nutriments"] == null || json["nutriments"].isEmpty ? null : Nutriments.fromMap(json["nutriments"]),
    productName: json["product_name"] == null ? null : json["product_name"],
    servingSize: json["serving_size"] == null ? null : json["serving_size"],
  );
}