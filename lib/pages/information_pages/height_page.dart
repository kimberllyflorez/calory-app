import 'package:calory_tracker/Widgets/button_next_widget.dart';
import 'package:calory_tracker/constants/user_constants.dart';
import 'package:calory_tracker/helpers/preference.dart';
import 'package:calory_tracker/theme/app_theme.dart';
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
          const Text('What is your Height?'),
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
                    style: const TextStyle(color: AppTheme.primary, fontWeight: FontWeight.w600, fontSize: 60),
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
                const Text('Cm')
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: ButtonNext(onTap: _onTap)
      ,
    );
  }

  _onPressed (String key, value)async {
    await PreferenceUtils.setString(key, value);
  }

 _onTap() {
   final height = int.parse(heightController.text);
    print(height);
   if (height <= 0) {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
       content: Container( child:  Text("height is not 0 ")),
     ));
     return;
   } else {
     Navigator.pushNamed(context, 'weightPage');
   }
 }
}
