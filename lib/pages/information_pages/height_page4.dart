import 'package:calory_tracker/Widgets/button_next.dart';
import 'package:calory_tracker/constants/user_constants.dart';
import 'package:calory_tracker/helpers/preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HeightPage extends StatefulWidget {
  const HeightPage({Key? key}) : super(key: key);

  @override
  State<HeightPage> createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  late final TextEditingController heightController;

  @override
  void initState() {
    heightController = TextEditingController(text: '190');
    super.initState();
  }
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
                    controller: heightController,
                    style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600, fontSize: 60),
                    //style: TextStyle(color: Colors.green, fontWeight: FontWeight.w300),,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      //hoverColor: Colors.green,
                    ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(3),
                      ],
                    onChanged:(value)=> _onPressed(UserConstants.height, value),
                  ),
                ),
                Text('cm')
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ButtonNext(onTap: _onTap)
      ,
    );
  }

  _onPressed (String key, value){
    PreferenceUtils.setString(key, value);
  }

 _onTap() {
   final age = int.parse(heightController.text);

   if (age <= 0) {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
       content: Container( child:  Text("heihht is not 0 ")),
     ));
     return;
   } else {
     Navigator.pushNamed(context, 'weightPage');
   }
 }
}
