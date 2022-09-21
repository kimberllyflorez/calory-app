import 'package:calory_tracker/products/model/model_product.dart';
import 'package:flutter/material.dart';

class MacrosProductSelect extends StatelessWidget {
  final Product product;
  final int index;

  const MacrosProductSelect({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              product.nutriments?.energyKcal.toString() ?? '(:',
            ),
            const Text('kcal'),
          ],
        ),
        const SizedBox(width: 5),
        Column(
          children: [
            Text(product.nutriments?.proteins.toString() ?? '(:'),
            const Text('protein'),
          ],
        ),
        const SizedBox(width: 5),
        Column(
          children: [
            Text(product.nutriments?.carbohydrates.toString() ?? ':('),
            const Text('carbs'),
          ],
        ),
        const SizedBox(width: 5),
        Column(
          children: [
            Text(product.nutriments?.fat.toString() ?? ':('),
            const Text('fats'),
          ],
        )
      ],
    );
  }
}