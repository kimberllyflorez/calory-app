import 'package:calory_tracker/Widgets/Button_Next.dart';
import 'package:flutter/material.dart';

class HelloPage extends StatelessWidget {
  const HelloPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget> [
            Text('Hello, Lets find out more about you'),


          ],
        ),
      ),
      floatingActionButton: ButtonNext(nextPage: 'genderPage', textButton: 'Next',),
    );
  }
}
