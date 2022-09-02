import 'package:calory_tracker/model/model_nutrients.dart';

class Product {
  Product({
    this.code,
    this.imageUrl,
    required this.nutriments,
    this.productName,
    this.servingSize,
    this.addedOn,
  });

  final String? code;
  final String? imageUrl;
  final Nutriments? nutriments;
  final String? productName;
  final String? servingSize;
  final DateTime? addedOn;

  Product copyWith({
    String? code,
    String? imageUrl,
    Nutriments? nutriments,
    String? productName,
    String? servingSize,
    DateTime? addedOn,
  }) =>
      Product(
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
            : Nutriments.fromMap(
                json["nutriments"],
              ),
        productName: json["product_name"],
        servingSize: json["serving_size"],
        addedOn: json["added_on"],
      );
}
