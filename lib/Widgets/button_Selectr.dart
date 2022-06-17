import 'package:flutter/material.dart';

class ButtonSelect extends StatefulWidget {
  final String nameButton;

  const ButtonSelect({Key? key, required this.nameButton}) : super(key: key);

  @override
  State<ButtonSelect> createState() => ButtonSelectState();
}

class ButtonSelectState extends State<ButtonSelect> {
  late bool select = false;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: Colors.green,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        widget.nameButton,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          //color: Colors.green,
        ),
      ),
      splashColor: Colors.black12,
      color: select? Colors.green : Colors.white10,
      onPressed: () {
        select = !select;
        setState(() {

        });
      },
    );
  }
}