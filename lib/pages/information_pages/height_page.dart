import 'package:calory_tracker/Widgets/button_next.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HeightPage extends StatelessWidget {
  const HeightPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('what is your Height?'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    autofocus: false,
                    initialValue: '180',
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600, fontSize: 60),
                    //style: TextStyle(color: Colors.green, fontWeight: FontWeight.w300),,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      //hoverColor: Colors.green,
                    ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                      ]
                  ),
                ),
                Text('cm')
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ButtonNext(nextPage: 'weightPage')
      ,
    );
  }
}
