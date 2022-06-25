import 'package:calory_tracker/Widgets/Button_Next.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Widgets/widgets.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({Key? key}) : super(key: key);

  @override
  State<GenderPage> createState() => _GenderPageState();
}


class _GenderPageState extends State<GenderPage> {
  //final List<String> buttons = ['women', 'men'];
  final bool select = false;
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Text('what is your gender ?'),
        Container(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonSelect(nameButton: 'women'),
              SizedBox(width: 5),
              ButtonSelect(nameButton: 'man'),

            ],
          ),
        ),

      ],
      ),
      floatingActionButton: ButtonNext(nextPage: 'agePage'),
    );
  }
}



class _button extends StatelessWidget {
  final String nameButton;

  const _button({Key? key, required this.nameButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: Colors.amber,
      child: Text(nameButton, style: TextStyle(
        fontWeight: FontWeight.bold,),),
      splashColor: Colors.amber,
      color: Colors.green,
      onPressed: ()  {

      },
    );
  }
}




//class _Buttongander extends StatelessWidget {
//   final String nameButton;
//   final Colors? colorselect;
//
//   const _Buttongander({Key? key, required this.nameButton, this.colorselect}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       //onTap: () => Navigator.pushNamed(context, 'fistpage'),
//       child: Container(color: Colors.green, height: 50, width: 50, child: Text(nameButton)),
//     );
//   }
// }
//Expanded(
//           child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
//               //scrollDirection: Axis.horizontal,
//               itemCount: buttons.length,
//               itemBuilder: (_, int i) {
//                 return _button(nameButton: buttons[i]);
//               }),
//         ),