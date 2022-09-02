import 'dart:convert';

import 'package:calory_tracker/model/model_search.dart';

class Nutriments {
  Nutriments({
    this.carbohydrates,
    this.carbohydratesServing,
    this.carbohydratesUnit,
    this.energy,
    this.energyKcal,
    this.energyKcalServing,
    this.energyKcalUnit,
    this.energyKj,
    this.energyKjServing,
    this.energyKjUnit,
    this.energy100G,
    this.energyServing,
    this.energyUnit,
    this.fat,
    this.fatServing,
    this.fatUnit,
    this.fiber,
    this.fiberServing,
    this.fiberUnit,
    this.proteins,
    this.proteinsServing,
    this.proteinsUnit,
    this.salt,
    this.saltServing,
    this.saltUnit,
    this.saltValue,
    this.saturatedFat,
    this.saturatedFatServing,
    this.saturatedFatUnit,
    this.sodium,
    this.sodiumServing,
    this.sodiumUnit,
    this.sugars,
    this.sugarsServing,
    this.sugarsUnit,
    this.sugarsValue,
    this.cholesterol,
    this.cholesterolServing,
    this.cholesterolUnit,
    this.transFat,
    this.transFatServing,
    this.transFatUnit,
  });

  final double? carbohydrates;
  final double? carbohydratesServing;
  final Unit? carbohydratesUnit;
  final double? energy;
  final double? energyKcal;
  final double? energyKcalServing;
  final EnergyUnit? energyKcalUnit;
  final double? energyKj;
  final double? energyKjServing;
  final EnergyUnit? energyKjUnit;
  final double? energy100G;
  final double? energyServing;
  final EnergyUnit? energyUnit;
  final double? fat;
  final double? fatServing;
  final Unit? fatUnit;
  final double? fiber;
  final double? fiberServing;
  final Unit? fiberUnit;
  final double? proteins;
  final double? proteinsServing;
  final Unit? proteinsUnit;
  final double? salt;
  final double? saltServing;
  final Unit? saltUnit;
  final double? saltValue;
  final double? saturatedFat;
  final double? saturatedFatServing;
  final Unit? saturatedFatUnit;
  final double? sodium;
  final double? sodiumServing;
  final Unit? sodiumUnit;
  final double? sugars;
  final double? sugarsServing;
  final Unit? sugarsUnit;
  final double? sugarsValue;
  final double? cholesterol;
  final double? cholesterolServing;
  final Unit? cholesterolUnit;
  final double? transFat;
  final double? transFatServing;
  final Unit? transFatUnit;

  factory Nutriments.fromJson(String str) => Nutriments.fromMap(json.decode(str));

  factory Nutriments.fromMap(Map<String, dynamic> json) => Nutriments(
        carbohydrates: json["carbohydrates"] == null ? null : json["carbohydrates"].toDouble(),
        carbohydratesServing:
            json["carbohydrates_serving"] == null ? null : json["carbohydrates_serving"].toDouble(),
        carbohydratesUnit:
            json["carbohydrates_unit"] == null ? null : unitValues.map[json["carbohydrates_unit"]],
        energyKcal: checkNumberType(json["energy-kcal"]),
        energyKcalServing:
            json["energy-kcal_serving"] == null ? null : json["energy-kcal_serving"].toDouble(),
        energyKcalUnit: json["energy-kcal_unit"] == null
            ? null
            : energyUnitValues.map[json["energy-kcal_unit"]],
        energyKj: checkNumberType(json["energy-kj"]),
        energyKjServing: checkNumberType(json["energy-kj_serving"]),
        energyKjUnit:
            json["energy-kj_unit"] == null ? null : energyUnitValues.map[json["energy-kj_unit"]],
        energy100G: checkNumberType(json["energy_100g"]),
        energyServing: checkNumberType(json["energy_serving"]),
        energyUnit: json["energy_unit"] == null ? null : energyUnitValues.map[json["energy_unit"]],
        fat: json["fat"] == null ? null : json["fat"].toDouble(),
        fatServing: json["fat_serving"] == null ? null : json["fat_serving"].toDouble(),
        fatUnit: json["fat_unit"] == null ? null : unitValues.map[json["fat_unit"]],
        fiber: json["fiber"] == null ? null : json["fiber"].toDouble(),
        fiberServing: json["fiber_serving"] == null ? null : json["fiber_serving"].toDouble(),
        fiberUnit: json["fiber_unit"] == null ? null : unitValues.map[json["fiber_unit"]],
        proteins: json["proteins"] == null ? null : json["proteins"].toDouble(),
        proteinsServing:
            json["proteins_serving"] == null ? null : json["proteins_serving"].toDouble(),
        proteinsUnit: json["proteins_unit"] == null ? null : unitValues.map[json["proteins_unit"]],
        salt: json["salt"] == null ? null : json["salt"].toDouble(),
        saltServing: json["salt_serving"] == null ? null : json["salt_serving"].toDouble(),
        saltUnit: json["salt_unit"] == null ? null : unitValues.map[json["salt_unit"]],
        saturatedFat: json["saturated-fat"] == null ? null : json["saturated-fat"].toDouble(),
        saturatedFatServing:
            json["saturated-fat_serving"] == null ? null : json["saturated-fat_serving"].toDouble(),
        saturatedFatUnit:
            json["saturated-fat_unit"] == null ? null : unitValues.map[json["saturated-fat_unit"]],
        sodium: json["sodium"] == null ? null : json["sodium"].toDouble(),
        sodiumServing: json["sodium_serving"] == null ? null : json["sodium_serving"].toDouble(),
        sodiumUnit: json["sodium_unit"] == null ? null : unitValues.map[json["sodium_unit"]],
        sugars: json["sugars"] == null ? null : json["sugars"].toDouble(),
        sugarsServing: json["sugars_serving"] == null ? null : json["sugars_serving"].toDouble(),
        sugarsUnit: json["sugars_unit"] == null ? null : unitValues.map[json["sugars_unit"]],
        cholesterol: checkNumberType(json["cholesterol"]),
        cholesterolServing: checkNumberType(json["cholesterol_serving"]),
        cholesterolUnit:
            json["cholesterol_unit"] == null ? null : unitValues.map[json["cholesterol_unit"]],
        transFat: checkNumberType(json["trans-fat"]),
        transFatServing: checkNumberType(json["trans-fat_serving"]),
        transFatUnit:
            json["trans-fat_unit"] == null ? null : unitValues.map[json["trans-fat_unit"]],
      );

  Map<String, dynamic> toMap() => {
        "carbohydrates": unitValues.reverse?[carbohydrates],
        "carbohydrates_serving": carbohydratesServing,
        "carbohydrates_unit": unitValues.reverse?[carbohydratesUnit],
        "energy": energy,
        "energy-kcal": energyKcal,
        "energy-kcal_serving": energyKcalServing,
        "energy-kcal_unit": unitValues.reverse?[energyKcalUnit],
        "energy_100g": energy100G,
        "energy_serving": energyServing,
        "energy_unit": unitValues.reverse?[energyUnit],
        "fat": fat,
        "fat_serving": fatServing,
        "fat_unit": unitValues.reverse?[fatUnit],
        "fiber": fiber,
        "fiber_serving": fiberServing,
        "fiber_unit": unitValues.reverse?[fiberUnit],
        "proteins": proteins,
        "proteins_serving": proteinsServing,
        "proteins_unit": unitValues.reverse?[proteinsUnit],
        "salt": salt,
        "salt_serving": saltServing,
        "salt_unit": unitValues.reverse?[saltUnit],
        "salt_value": saltValue,
        "saturated-fat": saturatedFat,
        "saturated-fat_serving": saturatedFatServing,
        "saturated-fat_unit": unitValues.reverse?[saturatedFatUnit],
        "sodium": sodium,
        "sodium_serving": sodiumServing,
        "sodium_unit": unitValues.reverse?[sodiumUnit],
        "sugars": sugars,
        "sugars_serving": sugarsServing,
        "sugars_unit":  unitValues.reverse?[sugarsUnit],
        "sugars_value": sugarsValue,
      };

  static checkNumberType(dynamic value) {
    if (value.runtimeType == double) {
      return value.toInt().toDouble();
    }
    if (value.runtimeType == double) {
      return value.toDouble();
    }
  }
}
