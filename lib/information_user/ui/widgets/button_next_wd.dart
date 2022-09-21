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
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const  Text('Next',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
