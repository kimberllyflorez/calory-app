import 'dart:convert';

import 'package:calory_tracker/model/model_Product.dart';

class SearchFoodModel {

  final int ?count;
  final int ?page;
  final int ?pageCount;
  final int ?pageSize;
  final List<Product>? products;
  final int? skip;

  SearchFoodModel({
    this.page,
    this.pageCount,
    this.pageSize,
    this.count,
    this.skip,
    this.products,
  });


  factory SearchFoodModel.fromJson(String str) => SearchFoodModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SearchFoodModel.fromMap(Map<String, dynamic> json) => SearchFoodModel(
        count: json["count"],
        page: json["page"],
        pageCount: json["page_count"],
        pageSize: json["page_size"],
        products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
        skip: json["skip"],
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "page": page,
        "page_count": pageCount,
        "page_size": pageSize,
        "products": products == null ? null : List<dynamic>.from(products?.map((x) => x.toMap()) ?? []),
        "skip": skip,
      };
}

enum Unit { G, EMPTY, MG }

final unitValues = EnumValues({"": Unit.EMPTY, "g": Unit.G, "mg": Unit.MG});

enum EnergyUnit { KCAL, K_J }

final energyUnitValues = EnumValues({"kcal": EnergyUnit.KCAL, "kJ": EnergyUnit.K_J});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
