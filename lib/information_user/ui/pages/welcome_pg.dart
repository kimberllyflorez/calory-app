import 'package:calory_tracker/information_user/ui/widgets/button_next_wd.dart';
import 'package:flutter/material.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: const Text('Hello, Lets find out more about you',
                textAlign: TextAlign.center,
               style: TextStyle(
                fontSize: 32,
              ),
              ),
            ),
          ),
          SizedBox(height: 5),
          ButtonNext(
            onTap: () => _onTap(context),
          ),
        ],
      ),

    );

  }
  _onTap(BuildContext context){
    Navigator.pushNamed(context , 'genderPage');
  }
}


