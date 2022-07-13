
import 'dart:convert';

import 'package:calory_tracker/model/model_search.dart';

class Nutriments {
  Nutriments({
    this.carbohydrates,
    this.carbohydrates100G,
    this.carbohydratesServing,
    this.carbohydratesUnit,
    this.carbohydratesValue,
    this.energy,
    this.energyKcal,
    this.energyKcal100G,
    this.energyKcalServing,
    this.energyKcalUnit,
    this.energyKcalValue,
    this.energyKj,
    this.energyKj100G,
    this.energyKjServing,
    this.energyKjUnit,
    this.energyKjValue,
    this.energy100G,
    this.energyServing,
    this.energyUnit,
    this.energyValue,
    this.fat,
    this.fat100G,
    this.fatServing,
    this.fatUnit,
    this.fatValue,
    this.fiber,
    this.fiber100G,
    this.fiberServing,
    this.fiberUnit,
    this.fiberValue,
    this.nutritionScoreFr,
    this.nutritionScoreFr100G,
    this.proteins,
    this.proteins100G,
    this.proteinsServing,
    this.proteinsUnit,
    this.proteinsValue,
    this.salt,
    this.salt100G,
    this.saltServing,
    this.saltUnit,
    this.saltValue,
    this.saturatedFat,
    this.saturatedFat100G,
    this.saturatedFatServing,
    this.saturatedFatUnit,
    this.saturatedFatValue,
    this.sodium,
    this.sodium100G,
    this.sodiumServing,
    this.sodiumUnit,
    this.sodiumValue,
    this.sugars,
    this.sugars100G,
    this.sugarsServing,
    this.sugarsUnit,
    this.sugarsValue,
    this.cholesterol,
    this.cholesterol100G,
    this.cholesterolServing,
    this.cholesterolUnit,
    this.cholesterolValue,
    this.transFat,
    this.transFat100G,
    this.transFatServing,
    this.transFatUnit,
    this.transFatValue,
  });

  final double? carbohydrates;
  final double? carbohydrates100G;
  final double? carbohydratesServing;
  final Unit? carbohydratesUnit;
  final double? carbohydratesValue;
  final double? energy;
  final double? energyKcal;
  final double? energyKcal100G;
  final double? energyKcalServing;
  final EnergyUnit? energyKcalUnit;
  final double? energyKcalValue;
  final double? energyKj;
  final double? energyKj100G;
  final double? energyKjServing;
  final EnergyUnit? energyKjUnit;
  final double? energyKjValue;
  final double? energy100G;
  final double? energyServing;
  final EnergyUnit? energyUnit;
  final double? energyValue;
  final double? fat;
  final double? fat100G;
  final double? fatServing;
  final Unit? fatUnit;
  final double? fatValue;
  final double? fiber;
  final double? fiber100G;
  final double? fiberServing;
  final Unit? fiberUnit;
  final double? fiberValue;
  final double? nutritionScoreFr;
  final double? nutritionScoreFr100G;
  final double? proteins;
  final double? proteins100G;
  final double? proteinsServing;
  final Unit? proteinsUnit;
  final double? proteinsValue;
  final double? salt;
  final double? salt100G;
  final double? saltServing;
  final Unit? saltUnit;
  final double? saltValue;
  final double? saturatedFat;
  final double? saturatedFat100G;
  final double? saturatedFatServing;
  final Unit? saturatedFatUnit;
  final double? saturatedFatValue;
  final double? sodium;
  final double? sodium100G;
  final double? sodiumServing;
  final Unit? sodiumUnit;
  final double? sodiumValue;
  final double? sugars;
  final double? sugars100G;
  final double? sugarsServing;
  final Unit? sugarsUnit;
  final double? sugarsValue;
  final double? cholesterol;
  final double? cholesterol100G;
  final double? cholesterolServing;
  final Unit? cholesterolUnit;
  final double? cholesterolValue;
  final double? transFat;
  final double? transFat100G;
  final double? transFatServing;
  final Unit? transFatUnit;
  final double? transFatValue;

  factory Nutriments.fromJson(String str) => Nutriments.fromMap(json.decode(str));

  factory Nutriments.fromMap(Map<String, dynamic> json) => Nutriments(
    carbohydrates: json["carbohydrates"] == null ? null : json["carbohydrates"].toDouble(),
    carbohydrates100G: json["carbohydrates_100g"] == null ? null : json["carbohydrates_100g"].toDouble(),
    carbohydratesServing: json["carbohydrates_serving"] == null ? null : json["carbohydrates_serving"].toDouble(),
    carbohydratesUnit: json["carbohydrates_unit"] == null ? null : unitValues.map[json["carbohydrates_unit"]],
    carbohydratesValue: json["carbohydrates_value"] == null ? null : json["carbohydrates_value"].toDouble(),
    energy: checkNumberType(json["energy"]),
    energyKcal: checkNumberType(json["energy-kcal"]),
    energyKcal100G: checkNumberType(json["energy-kcal_100g"]),
    energyKcalServing: json["energy-kcal_serving"] == null ? null : json["energy-kcal_serving"].toDouble(),
    energyKcalUnit: json["energy-kcal_unit"] == null ? null : energyUnitValues.map[json["energy-kcal_unit"]],
    energyKcalValue: checkNumberType(json["energy-kcal_value"]),
    energyKj: checkNumberType(json["energy-kj"]),
    energyKj100G: checkNumberType(json["energy-kj_100g"]),
    energyKjServing: checkNumberType(json["energy-kj_serving"]),
    energyKjUnit: json["energy-kj_unit"] == null ? null : energyUnitValues.map[json["energy-kj_unit"]],
    energyKjValue: checkNumberType(json["energy-kj_value"]),
    energy100G: checkNumberType(json["energy_100g"]),
    energyServing: checkNumberType(json["energy_serving"]),
    energyUnit: json["energy_unit"] == null ? null : energyUnitValues.map[json["energy_unit"]],
    energyValue: checkNumberType(json["energy_value"]),
    fat: json["fat"] == null ? null : json["fat"].toDouble(),
    fat100G: json["fat_100g"] == null ? null : json["fat_100g"].toDouble(),
    fatServing: json["fat_serving"] == null ? null : json["fat_serving"].toDouble(),
    fatUnit: json["fat_unit"] == null ? null : unitValues.map[json["fat_unit"]],
    fatValue: json["fat_value"] == null ? null : json["fat_value"].toDouble(),
    fiber: json["fiber"] == null ? null : json["fiber"].toDouble(),
    fiber100G: json["fiber_100g"] == null ? null : json["fiber_100g"].toDouble(),
    fiberServing: json["fiber_serving"] == null ? null : json["fiber_serving"].toDouble(),
    fiberUnit: json["fiber_unit"] == null ? null : unitValues.map[json["fiber_unit"]],
    fiberValue: json["fiber_value"] == null ? null : json["fiber_value"].toDouble(),
    nutritionScoreFr: checkNumberType(json["nutrition-score-fr"]),
    nutritionScoreFr100G: checkNumberType(json["nutrition-score-fr_100g"]),
    proteins: json["proteins"] == null ? null : json["proteins"].toDouble(),
    proteins100G: json["proteins_100g"] == null ? null : json["proteins_100g"].toDouble(),
    proteinsServing: json["proteins_serving"] == null ? null : json["proteins_serving"].toDouble(),
    proteinsUnit: json["proteins_unit"] == null ? null : unitValues.map[json["proteins_unit"]],
    proteinsValue: json["proteins_value"] == null ? null : json["proteins_value"].toDouble(),
    salt: json["salt"] == null ? null : json["salt"].toDouble(),
    salt100G: json["salt_100g"] == null ? null : json["salt_100g"].toDouble(),
    saltServing: json["salt_serving"] == null ? null : json["salt_serving"].toDouble(),
    saltUnit: json["salt_unit"] == null ? null : unitValues.map[json["salt_unit"]],
    saltValue: json["salt_value"] == null ? null : json["salt_value"].toDouble(),
    saturatedFat: json["saturated-fat"] == null ? null : json["saturated-fat"].toDouble(),
    saturatedFat100G: json["saturated-fat_100g"] == null ? null : json["saturated-fat_100g"].toDouble(),
    saturatedFatServing: json["saturated-fat_serving"] == null ? null : json["saturated-fat_serving"].toDouble(),
    saturatedFatUnit: json["saturated-fat_unit"] == null ? null : unitValues.map[json["saturated-fat_unit"]],
    saturatedFatValue: json["saturated-fat_value"] == null ? null : json["saturated-fat_value"].toDouble(),
    sodium: json["sodium"] == null ? null : json["sodium"].toDouble(),
    sodium100G: json["sodium_100g"] == null ? null : json["sodium_100g"].toDouble(),
    sodiumServing: json["sodium_serving"] == null ? null : json["sodium_serving"].toDouble(),
    sodiumUnit: json["sodium_unit"] == null ? null : unitValues.map[json["sodium_unit"]],
    sodiumValue: json["sodium_value"] == null ? null : json["sodium_value"].toDouble(),
    sugars: json["sugars"] == null ? null : json["sugars"].toDouble(),
    sugars100G: json["sugars_100g"] == null ? null : json["sugars_100g"].toDouble(),
    sugarsServing: json["sugars_serving"] == null ? null : json["sugars_serving"].toDouble(),
    sugarsUnit: json["sugars_unit"] == null ? null : unitValues.map[json["sugars_unit"]],
    sugarsValue: json["sugars_value"] == null ? null : json["sugars_value"].toDouble(),
    cholesterol: checkNumberType(json["cholesterol"]),
    cholesterol100G: checkNumberType(json["cholesterol_100g"]),
    cholesterolServing: checkNumberType(json["cholesterol_serving"]),
    cholesterolUnit: json["cholesterol_unit"] == null ? null : unitValues.map[json["cholesterol_unit"]],
    cholesterolValue: checkNumberType(json["cholesterol_value"]),
    transFat: checkNumberType(json["trans-fat"]),
    transFat100G: checkNumberType(json["trans-fat_100g"]),
    transFatServing: checkNumberType(json["trans-fat_serving"]),
    transFatUnit: json["trans-fat_unit"] == null ? null : unitValues.map[json["trans-fat_unit"]],
    transFatValue: checkNumberType(json["trans-fat_value"]),
  );

  static checkNumberType(dynamic value){
    if(value.runtimeType == double){
      return value.toInt().toDouble();
    }
    if(value.runtimeType == double){
      return value.toDouble();
    }
  }
}