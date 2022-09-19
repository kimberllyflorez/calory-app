import 'package:calory_tracker/calorie_calculator/model/model_macros.dart';
import 'package:calory_tracker/home/ui/widgets/ExpandableWidget/expandeble_container_widget.dart';
import 'package:calory_tracker/home/ui/widgets/productos_list/productList_widget.dart';
import 'package:calory_tracker/products/providers/products_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class ExpandableListMealsWidget extends StatefulWidget {
  final String title;
  final int index;
  final String imageMeals;

  const ExpandableListMealsWidget({
    Key? key,
    required this.title,
    required this.index,
    required this.imageMeals,
  }) : super(key: key);

  @override
  _ExpandableListMealsWidgetState createState() => _ExpandableListMealsWidgetState();
}

class _ExpandableListMealsWidgetState extends State<ExpandableListMealsWidget> {
  bool expandFlag = false;

  @override
  Widget build(BuildContext context) {
    final ModelMacros macros = context.watch<ProductsProvider>().macroForFood(widget.index);

    return Column(
      children: <Widget>[
        Container(
          // color: Colors.red,
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          //padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                  image: AssetImage(widget.imageMeals),
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
                  ),
                  const SizedBox(height: 10),
                  Text('${macros.totalCalories} kcal')
                ],
              ),
              Column(
                children: [
                  _MealExpandedIcon(
                    isExpanded: expandFlag,
                    onPressed: () {
                      setState(() {
                        expandFlag = !expandFlag;
                      });
                    },
                  ),
                  _MealsMacros(
                    macros: macros,
                  ),
                ],
              ),
            ],
          ),
        ),
        ExpandableContainerWidget(
          expanded: expandFlag, index: widget.index,

          //child: const _BodyExpanded(),
        ),
        ProductList(
          listIndex: widget.index,
        ),
        const Divider(),
      ],
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
          //TODO poner la suma de gramos de alimnetos seleccionados
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

//class ListFoods extends StatefulWidget {
//   final String title;
//
//   const ListFoods({Key? key, required this.title}) : super(key: key);
//
//   @override
//   _ListFoodsState createState() => _ListFoodsState();
// }
//
// class _ListFoodsState extends State<ListFoods> {
//   bool expandFlag = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           Container(
//             width: MediaQuery.of(context).size.width * 0.2,
//             height: MediaQuery.of(context).size.width * 0.2,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: const Image(
//               image: AssetImage('assets/ic_dinner.png'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           Column(
//             children: [
//               Text(
//                 widget.title,
//                 style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
//               ),
//               const SizedBox(height: 10),
//               const Text(' 0 kcal')
//             ],
//           ),
//           Column(
//             children: [
//               IconButton(
//                   alignment: Alignment.topRight,
//                   icon: Container(
//                     alignment: Alignment.centerRight,
//                     child: Center(
//                       child: Icon(
//                         expandFlag ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
//                         size: 20.0,
//                       ),
//                     ),
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       expandFlag = !expandFlag;
//                     });
//                   }),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
