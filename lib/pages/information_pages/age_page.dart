import 'package:calory_tracker/Widgets/Button_Next.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AgePage extends StatelessWidget {
  const AgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('what is your age ?'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    autofocus: false,
                    initialValue: '20',
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600, fontSize: 60),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                     // fillColor: Colors.green,
                     // filled: true,
                    ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                      ]
                  ),

                ),
                Text('years')
              ],
            ),
          ),

        ],
      ),
      floatingActionButton: ButtonNext(nextPage: 'heightPage'),
    );
  }
}
