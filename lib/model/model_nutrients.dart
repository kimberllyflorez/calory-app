
import 'dart:convert';

import 'package:calory_tracker/model/model_search.dart';

class Nutriments {
  Nutriments({
    this.carbohydrates,
    this.carbohydrates100G,
    this.carbohydratesServing,
    this.carbohydratesUnit,
    this.carbohydratesValue,
    this.carbonFootprintFromKnownIngredients100G,
    this.carbonFootprintFromKnownIngredientsProduct,
    this.carbonFootprintFromKnownIngredientsServing,
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
    this.fruitsVegetablesNutsEstimateFromIngredients100G,
    this.fruitsVegetablesNutsEstimateFromIngredientsServing,
    this.novaGroup,
    this.novaGroup100G,
    this.novaGroupServing,
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
    this.fruitsVegetablesNutsDried,
    this.fruitsVegetablesNutsDried100G,
    this.fruitsVegetablesNutsDriedServing,
    this.fruitsVegetablesNutsDriedUnit,
    this.fruitsVegetablesNutsDriedValue,
    this.calcium,
    this.calcium100G,
    this.calciumServing,
    this.calciumUnit,
    this.calciumValue,
    this.cholesterol,
    this.cholesterol100G,
    this.cholesterolServing,
    this.cholesterolUnit,
    this.cholesterolValue,
    this.iron,
    this.iron100G,
    this.ironServing,
    this.ironUnit,
    this.ironValue,
    this.transFat,
    this.transFat100G,
    this.transFatServing,
    this.transFatUnit,
    this.transFatValue,
    this.vitaminA,
    this.vitaminA100G,
    this.vitaminAServing,
    this.vitaminAUnit,
    this.vitaminAValue,
    this.vitaminC,
    this.vitaminC100G,
    this.vitaminCServing,
    this.vitaminCUnit,
    this.vitaminCValue,
  });

  final double? carbohydrates;
  final double? carbohydrates100G;
  final double? carbohydratesServing;
  final Unit? carbohydratesUnit;
  final double? carbohydratesValue;
  final double? carbonFootprintFromKnownIngredients100G;
  final double? carbonFootprintFromKnownIngredientsProduct;
  final double? carbonFootprintFromKnownIngredientsServing;
  final int? energy;
  final int? energyKcal;
  final int? energyKcal100G;
  final double? energyKcalServing;
  final EnergyUnit? energyKcalUnit;
  final int? energyKcalValue;
  final int? energyKj;
  final int? energyKj100G;
  final int? energyKjServing;
  final EnergyUnit? energyKjUnit;
  final int? energyKjValue;
  final int? energy100G;
  final int? energyServing;
  final EnergyUnit? energyUnit;
  final int? energyValue;
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
  final double? fruitsVegetablesNutsEstimateFromIngredients100G;
  final double? fruitsVegetablesNutsEstimateFromIngredientsServing;
  final int? novaGroup;
  final int? novaGroup100G;
  final int? novaGroupServing;
  final int? nutritionScoreFr;
  final int? nutritionScoreFr100G;
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
  final int? fruitsVegetablesNutsDried;
  final int? fruitsVegetablesNutsDried100G;
  final int? fruitsVegetablesNutsDriedServing;
  final Unit? fruitsVegetablesNutsDriedUnit;
  final int? fruitsVegetablesNutsDriedValue;
  final double? calcium;
  final double? calcium100G;
  final double? calciumServing;
  final Unit? calciumUnit;
  final int? calciumValue;
  final int? cholesterol;
  final int? cholesterol100G;
  final int? cholesterolServing;
  final Unit? cholesterolUnit;
  final int? cholesterolValue;
  final int? iron;
  final int? iron100G;
  final int? ironServing;
  final Unit? ironUnit;
  final int? ironValue;
  final int? transFat;
  final int? transFat100G;
  final int? transFatServing;
  final Unit? transFatUnit;
  final int? transFatValue;
  final int? vitaminA;
  final int? vitaminA100G;
  final int? vitaminAServing;
  final String? vitaminAUnit;
  final int? vitaminAValue;
  final int? vitaminC;
  final int? vitaminC100G;
  final int? vitaminCServing;
  final Unit? vitaminCUnit;
  final int? vitaminCValue;

  factory Nutriments.fromJson(String str) => Nutriments.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Nutriments.fromMap(Map<String, dynamic> json) => Nutriments(
    carbohydrates: json["carbohydrates"] == null ? null : json["carbohydrates"].toDouble(),
    carbohydrates100G: json["carbohydrates_100g"] == null ? null : json["carbohydrates_100g"].toDouble(),
    carbohydratesServing: json["carbohydrates_serving"] == null ? null : json["carbohydrates_serving"].toDouble(),
    carbohydratesUnit: json["carbohydrates_unit"] == null ? null : unitValues.map[json["carbohydrates_unit"]],
    carbohydratesValue: json["carbohydrates_value"] == null ? null : json["carbohydrates_value"].toDouble(),
    carbonFootprintFromKnownIngredients100G: json["carbon-footprint-from-known-ingredients_100g"] == null ? null : json["carbon-footprint-from-known-ingredients_100g"].toDouble(),
    carbonFootprintFromKnownIngredientsProduct: json["carbon-footprint-from-known-ingredients_product"] == null ? null : json["carbon-footprint-from-known-ingredients_product"].toDouble(),
    carbonFootprintFromKnownIngredientsServing: json["carbon-footprint-from-known-ingredients_serving"] == null ? null : json["carbon-footprint-from-known-ingredients_serving"].toDouble(),
    energy: json["energy"],
    energyKcal: json["energy-kcal"],
    energyKcal100G: json["energy-kcal_100g"],
    energyKcalServing: json["energy-kcal_serving"] == null ? null : json["energy-kcal_serving"].toDouble(),
    energyKcalUnit: json["energy-kcal_unit"] == null ? null : energyUnitValues.map[json["energy-kcal_unit"]],
    energyKcalValue: json["energy-kcal_value"],
    energyKj: json["energy-kj"],
    energyKj100G: json["energy-kj_100g"],
    energyKjServing: json["energy-kj_serving"],
    energyKjUnit: json["energy-kj_unit"] == null ? null : energyUnitValues.map[json["energy-kj_unit"]],
    energyKjValue: json["energy-kj_value"],
    energy100G: json["energy_100g"],
    energyServing: json["energy_serving"],
    energyUnit: json["energy_unit"] == null ? null : energyUnitValues.map[json["energy_unit"]],
    energyValue: json["energy_value"],
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
    fruitsVegetablesNutsEstimateFromIngredients100G: json["fruits-vegetables-nuts-estimate-from-ingredients_100g"] == null ? null : json["fruits-vegetables-nuts-estimate-from-ingredients_100g"].toDouble(),
    fruitsVegetablesNutsEstimateFromIngredientsServing: json["fruits-vegetables-nuts-estimate-from-ingredients_serving"] == null ? null : json["fruits-vegetables-nuts-estimate-from-ingredients_serving"].toDouble(),
    novaGroup: json["nova-group"],
    novaGroup100G: json["nova-group_100g"],
    novaGroupServing: json["nova-group_serving"],
    nutritionScoreFr: json["nutrition-score-fr"],
    nutritionScoreFr100G: json["nutrition-score-fr_100g"],
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
    fruitsVegetablesNutsDried: json["fruits-vegetables-nuts-dried"],
    fruitsVegetablesNutsDried100G: json["fruits-vegetables-nuts-dried_100g"],
    fruitsVegetablesNutsDriedServing: json["fruits-vegetables-nuts-dried_serving"],
    fruitsVegetablesNutsDriedUnit: json["fruits-vegetables-nuts-dried_unit"] == null ? null : unitValues.map[json["fruits-vegetables-nuts-dried_unit"]],
    fruitsVegetablesNutsDriedValue: json["fruits-vegetables-nuts-dried_value"],
    calcium: json["calcium"] == null ? null : json["calcium"].toDouble(),
    calcium100G: json["calcium_100g"] == null ? null : json["calcium_100g"].toDouble(),
    calciumServing: json["calcium_serving"] == null ? null : json["calcium_serving"].toDouble(),
    calciumUnit: json["calcium_unit"] == null ? null : unitValues.map[json["calcium_unit"]],
    calciumValue: json["calcium_value"],
    cholesterol: json["cholesterol"],
    cholesterol100G: json["cholesterol_100g"],
    cholesterolServing: json["cholesterol_serving"],
    cholesterolUnit: json["cholesterol_unit"] == null ? null : unitValues.map[json["cholesterol_unit"]],
    cholesterolValue: json["cholesterol_value"],
    iron: json["iron"],
    iron100G: json["iron_100g"],
    ironServing: json["iron_serving"],
    ironUnit: json["iron_unit"] == null ? null : unitValues.map[json["iron_unit"]],
    ironValue: json["iron_value"],
    transFat: json["trans-fat"],
    transFat100G: json["trans-fat_100g"],
    transFatServing: json["trans-fat_serving"],
    transFatUnit: json["trans-fat_unit"] == null ? null : unitValues.map[json["trans-fat_unit"]],
    transFatValue: json["trans-fat_value"],
    vitaminA: json["vitamin-a"],
    vitaminA100G: json["vitamin-a_100g"],
    vitaminAServing: json["vitamin-a_serving"],
    vitaminAUnit: json["vitamin-a_unit"],
    vitaminAValue: json["vitamin-a_value"],
    vitaminC: json["vitamin-c"],
    vitaminC100G: json["vitamin-c_100g"],
    vitaminCServing: json["vitamin-c_serving"],
    vitaminCUnit: json["vitamin-c_unit"] == null ? null : unitValues.map[json["vitamin-c_unit"]],
    vitaminCValue: json["vitamin-c_value"],
  );

  Map<String, dynamic> toMap() => {
    "carbohydrates": carbohydrates,
    "carbohydrates_100g": carbohydrates100G,
    "carbohydrates_serving": carbohydratesServing,
    "carbohydrates_unit": carbohydratesUnit == null ? null : unitValues.reverse?[carbohydratesUnit],
    "carbohydrates_value": carbohydratesValue,
    "carbon-footprint-from-known-ingredients_100g": carbonFootprintFromKnownIngredients100G,
    "carbon-footprint-from-known-ingredients_product": carbonFootprintFromKnownIngredientsProduct,
    "carbon-footprint-from-known-ingredients_serving": carbonFootprintFromKnownIngredientsServing,
    "energy": energy,
    "energy-kcal": energyKcal,
    "energy-kcal_100g": energyKcal100G,
    "energy-kcal_serving": energyKcalServing,
    "energy-kcal_unit": energyKcalUnit == null ? null : energyUnitValues.reverse?[energyKcalUnit],
    "energy-kcal_value": energyKcalValue,
    "energy-kj": energyKj,
    "energy-kj_100g": energyKj100G,
    "energy-kj_serving": energyKjServing,
    "energy-kj_unit": energyKjUnit == null ? null : energyUnitValues.reverse?[energyKjUnit],
    "energy-kj_value": energyKjValue,
    "energy_100g": energy100G,
    "energy_serving": energyServing,
    "energy_unit": energyUnit == null ? null : energyUnitValues.reverse?[energyUnit],
    "energy_value": energyValue,
    "fat": fat,
    "fat_100g": fat100G,
    "fat_serving": fatServing,
    "fat_unit": fatUnit == null ? null : unitValues.reverse?[fatUnit],
    "fat_value": fatValue,
    "fiber": fiber,
    "fiber_100g": fiber100G,
    "fiber_serving": fiberServing,
    "fiber_unit": fiberUnit == null ? null : unitValues.reverse?[fiberUnit],
    "fiber_value": fiberValue,
    "fruits-vegetables-nuts-estimate-from-ingredients_100g": fruitsVegetablesNutsEstimateFromIngredients100G,
    "fruits-vegetables-nuts-estimate-from-ingredients_serving": fruitsVegetablesNutsEstimateFromIngredientsServing,
    "nova-group": novaGroup,
    "nova-group_100g": novaGroup100G,
    "nova-group_serving": novaGroupServing,
    "nutrition-score-fr": nutritionScoreFr,
    "nutrition-score-fr_100g": nutritionScoreFr100G,
    "proteins": proteins,
    "proteins_100g": proteins100G,
    "proteins_serving": proteinsServing,
    "proteins_unit": proteinsUnit == null ? null : unitValues.reverse?[proteinsUnit],
    "proteins_value": proteinsValue,
    "salt": salt,
    "salt_100g": salt100G,
    "salt_serving": saltServing,
    "salt_unit": saltUnit == null ? null : unitValues.reverse?[saltUnit],
    "salt_value": saltValue,
    "saturated-fat": saturatedFat,
    "saturated-fat_100g": saturatedFat100G,
    "saturated-fat_serving": saturatedFatServing,
    "saturated-fat_unit": saturatedFatUnit == null ? null : unitValues.reverse?[saturatedFatUnit],
    "saturated-fat_value": saturatedFatValue,
    "sodium": sodium,
    "sodium_100g": sodium100G,
    "sodium_serving": sodiumServing,
    "sodium_unit": sodiumUnit == null ? null : unitValues.reverse?[sodiumUnit],
    "sodium_value": sodiumValue,
    "sugars": sugars,
    "sugars_100g": sugars100G,
    "sugars_serving": sugarsServing,
    "sugars_unit": sugarsUnit == null ? null : unitValues.reverse?[sugarsUnit],
    "sugars_value": sugarsValue,
    "fruits-vegetables-nuts-dried": fruitsVegetablesNutsDried,
    "fruits-vegetables-nuts-dried_100g": fruitsVegetablesNutsDried100G,
    "fruits-vegetables-nuts-dried_serving": fruitsVegetablesNutsDriedServing,
    "fruits-vegetables-nuts-dried_unit": fruitsVegetablesNutsDriedUnit == null ? null : unitValues.reverse?[fruitsVegetablesNutsDriedUnit],
    "fruits-vegetables-nuts-dried_value": fruitsVegetablesNutsDriedValue,
    "calcium": calcium,
    "calcium_100g": calcium100G,
    "calcium_serving": calciumServing,
    "calcium_unit": calciumUnit == null ? null : unitValues.reverse?[calciumUnit],
    "calcium_value": calciumValue,
    "cholesterol": cholesterol,
    "cholesterol_100g": cholesterol100G,
    "cholesterol_serving": cholesterolServing,
    "cholesterol_unit": cholesterolUnit == null ? null : unitValues.reverse?[cholesterolUnit],
    "cholesterol_value": cholesterolValue,
    "iron": iron,
    "iron_100g": iron100G,
    "iron_serving": ironServing,
    "iron_unit": ironUnit == null ? null : unitValues.reverse?[ironUnit],
    "iron_value": ironValue,
    "trans-fat": transFat,
    "trans-fat_100g": transFat100G,
    "trans-fat_serving": transFatServing,
    "trans-fat_unit": transFatUnit == null ? null : unitValues.reverse?[transFatUnit],
    "trans-fat_value": transFatValue,
    "vitamin-a": vitaminA,
    "vitamin-a_100g": vitaminA100G,
    "vitamin-a_serving": vitaminAServing,
    "vitamin-a_unit": vitaminAUnit,
    "vitamin-a_value": vitaminAValue,
    "vitamin-c": vitaminC,
    "vitamin-c_100g": vitaminC100G,
    "vitamin-c_serving": vitaminCServing,
    "vitamin-c_unit": vitaminCUnit == null ? null : unitValues.reverse?[vitaminCUnit],
    "vitamin-c_value": vitaminCValue,
  };
}