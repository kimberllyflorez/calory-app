import 'package:calory_tracker/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ButtonSelect extends StatelessWidget {
  final String nameButton;
  final Function()? onPressed;
  final bool select;
  final double? fontSizeText ;

  const ButtonSelect({
    Key? key,
    required this.nameButton,
    this.select = false,
    this.onPressed,
    this.fontSizeText ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: AppTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        nameButton,
        style:  TextStyle(
          fontSize: fontSizeText ?? 26,
          fontWeight: FontWeight.bold,
          //color: Colors.green,
        ),
      ),
      splashColor: Colors.black12,
      color: select ? AppTheme.formColor : Colors.white10,
      onPressed: _onPressed,
    );
  }

  _onPressed() {
    final call = onPressed;
    if (call != null) {
      call();
    }
  }
}
