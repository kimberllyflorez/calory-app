import 'package:calory_tracker/information_user/widgets/button_next_widget.dart';
import 'package:flutter/material.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            Text('Hello, Lets find out more about you'),
          ],
        ),
      ),
      floatingActionButton:  ButtonNext(
        onTap: () => _onTap(context),
      ),
    );

  }
  _onTap(BuildContext context){
    Navigator.pushNamed(context , 'genderPage');
  }
}


