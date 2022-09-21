import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:calory_tracker/products/ui/search_Product.dart';
import 'package:flutter/material.dart';

class ExpandableContainerWidget extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget? child;
  final int index;


  const ExpandableContainerWidget({
    Key? key,
    this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 70.0,
    this.expanded = true,
    required this.index,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth * 0.9,
      height: expanded ? expandedHeight : collapsedHeight,
      child:  _BodyExpanded(index: index),
    );
  }
}

class _BodyExpanded extends StatelessWidget {
  final int index;


  const _BodyExpanded({
    Key? key,
    required this.index,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        border: Border.all(width: 3.0, color: AppTheme.primary),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (route) => SearchFood(
                    index: index,

                  ),
                )),
            child:  const Text(
              "+",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppTheme.primary,
                fontSize: 20,
              ),
            ),
          ),
          const Text(
            "Add food",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppTheme.primary,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
