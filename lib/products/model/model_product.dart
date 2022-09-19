
import 'package:calory_tracker/products/model/model_nutrients.dart';

class Product {
  Product({
    this.id,
    this.code,
    this.imageUrl,
    required this.nutriments,
    this.productName,
    this.servingSize,
    this.addedOn,
  });

  final String? id;
  final String? code;
  final String? imageUrl;
  final Nutriments? nutriments;
  final String? productName;
  final String? servingSize;
  final DateTime? addedOn;

  Product copyWith({
    String? id,
    String? code,
    String? imageUrl,
    Nutriments? nutriments,
    String? productName,
    String? servingSize,
    DateTime? addedOn,
  }) =>
      Product(
        id: id ?? this.id,
        code: code ?? this.code,
        imageUrl: imageUrl ?? this.imageUrl,
        nutriments: nutriments ?? this.nutriments,
        productName: productName ?? this.productName,
        servingSize: servingSize ?? this.servingSize,
        addedOn: addedOn ?? this.addedOn,
      );

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        code: json["code"],
        imageUrl: json["image_url"],
        nutriments: json["nutriments"] == null || json["nutriments"].isEmpty
            ? null
            : Nutriments.fromMap(json["nutriments"]),
        productName: json["product_name"].toString(),
        servingSize: json["serving_size"],
        addedOn: json["added_on"],
      );

  factory Product.fromFirebaseMap(Map<dynamic, dynamic> json, String value) => Product(
    id: value,
    code: json["code"] ?? '',
    imageUrl: json["image_url"] ?? '',
    nutriments: json["nutriments"] == null || json["nutriments"].isEmpty
        ? null
        : Nutriments.fromFirebaseMap(json["nutriments"]),
    productName: json["product_name"] ?? '',
    servingSize: json["serving_size"] ?? '',
    addedOn: DateTime.parse(json["added_on"]),
  );

  Map<String, dynamic> toMap() => {
        'code': code,
        'image_url': imageUrl,
        'nutriments': nutriments?.toMap(),
        'product_name': productName,
        'serving_size': servingSize,
        'added_on': addedOn?.toIso8601String(),
      };
}
