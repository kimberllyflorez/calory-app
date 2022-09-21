import 'package:calory_tracker/calorie_calculator/model/model_macros.dart';
import 'package:calory_tracker/home/ui/widgets/home_add_food_wd.dart';
import 'package:calory_tracker/home/ui/widgets/home_product_list_selected.wd.dart';
import 'package:calory_tracker/products/providers/products_provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealSection extends StatefulWidget {
  final String title;
  final int index;
  final String imageMeals;

  const MealSection({
    Key? key,
    required this.title,
    required this.index,
    required this.imageMeals,
  }) : super(key: key);

  @override
  _MealSectionState createState() => _MealSectionState();
}
class _MealSectionState extends State<MealSection> {
  bool expandFlag = false;

  @override
  Widget build(BuildContext context) {
    final ModelMacros macros = context.watch<ProductsProvider>().macroForFood(widget.index);

    return Column(
      children: <Widget>[
        MealsList(
          title: widget.title,
          index: widget.index,
          imageMeals: widget.imageMeals,
          expandedFlag: expandFlag,
          onPressedExpand: () {
            setState(() {
              expandFlag = !expandFlag;
            });
          },
        ),
        ExpandableContainerWidget(
          expanded: expandFlag, index: widget.index,

          //child: const _BodyExpanded(),
        ),
        ProductListSelected(
          listIndex: widget.index,
        ),
        const Divider(),
      ],
    );
  }
}

class MealsList extends StatelessWidget {
  final String title;
  final int index;
  final String imageMeals;
  final bool expandedFlag;
  final Function() onPressedExpand;

  const MealsList({
    Key? key,
    required this.title,
    required this.index,
    required this.imageMeals,
    required this.expandedFlag,
    required this.onPressedExpand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ModelMacros macros = context.watch<ProductsProvider>().macroForFood(index);

    return Container(
      color: Colors.red,
      margin: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image(
              image: AssetImage(imageMeals),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
              const SizedBox(height: 10),
              Text('${macros.totalCalories} kcal')
            ],
          ),
          Column(
            children: [
              _MealExpandedIcon(
                isExpanded: expandedFlag,
                onPressed: onPressedExpand,
              ),
              _MealsMacros(
                macros: macros,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MealExpandedIcon extends StatelessWidget {
  final bool isExpanded;
  final Function() onPressed;

  const _MealExpandedIcon({
    Key? key,
    required this.isExpanded,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.topRight,
      icon: Container(
        alignment: Alignment.centerRight,
        child: Center(
          child: Icon(
            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            size: 20.0,
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}

class _MealsMacros extends StatelessWidget {
  final ModelMacros macros;

  const _MealsMacros({
    required this.macros,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              macros.proteinGrams.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 10),
            Text(macros.carbohydrateGrams.toString(),
                style: const TextStyle(fontWeight: FontWeight.w400)),
            const SizedBox(width: 19),
            Text(macros.fatGrams.toString(), style: const TextStyle(fontWeight: FontWeight.w400)),
          ],
        ),
        Row(
          children: const [
            Text('protein', style: TextStyle(fontWeight: FontWeight.w400)),
            SizedBox(width: 5),
            Text('carbs', style: TextStyle(fontWeight: FontWeight.w400)),
            SizedBox(width: 5),
            Text('fat', style: TextStyle(fontWeight: FontWeight.w400)),
          ],
        )
      ],
    );
  }
}
