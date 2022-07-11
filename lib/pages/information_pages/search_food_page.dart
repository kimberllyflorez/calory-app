import 'package:flutter/material.dart';

class SearchFood extends StatelessWidget {
  const SearchFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('BREACKFAST', textAlign: TextAlign.start,),
          centerTitle: false,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                suffixIcon: Icon(Icons.search, color: Colors.white),
                hintText: 'What do want to eat?',
                labelStyle: TextStyle(
                  color: Colors.green,
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none
              ),
            ),
          ),
        ],
      ),
    );
  }
}
