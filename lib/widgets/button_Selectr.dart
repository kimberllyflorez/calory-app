import 'package:flutter/material.dart';

class ButtonSelect extends StatelessWidget {
  final String nameButton;
  final Function()? onPressed;
  final bool select;

  const ButtonSelect({
    Key? key,
    required this.nameButton,
    this.select = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Text(
        nameButton,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          //color: Colors.green,
        ),
      ),
      splashColor: Colors.black12,
      color: select ? Colors.green : Colors.white10,
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
