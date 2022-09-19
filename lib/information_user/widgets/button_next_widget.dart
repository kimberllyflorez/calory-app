import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ButtonNext extends StatelessWidget {
  final void Function()? onTap;


  const ButtonNext({
  Key? key,

    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(25),
        ),

        width: 80,
        height: 50,
        child:   Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[Text('Next')] ,
        ),
      ),
    );
  }
}
