import 'package:calory_tracker/widgets/ExpandableWidget/expandeble_container_widget.dart';
import 'package:calory_tracker/widgets/productList_widget.dart';
import 'package:flutter/material.dart';

class ExpandableListFoodsWidget extends StatefulWidget {
  final String title;
  final int index;

  const ExpandableListFoodsWidget({
    Key? key,
    required this.title,
    required this.index,
  }) : super(key: key);

  @override
  _ExpandableListFoodsWidgetState createState() => _ExpandableListFoodsWidgetState();
}

class _ExpandableListFoodsWidgetState extends State<ExpandableListFoodsWidget> {
  bool expandFlag = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          // color: Colors.red,
          margin: const EdgeInsets.only(left: 10, right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Image(
                  image: AssetImage('assets/ic_dinner.png'),
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
                  ),
                  const SizedBox(height: 10),
                  const Text(' 0 kcal')
                ],
              ),
              Column(
                children: [
                  IconButton(
                      alignment: Alignment.topRight,
                      icon: Container(
                        alignment: Alignment.centerRight,
                        child: Center(
                          child: Icon(
                            expandFlag ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                            size: 20.0,
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          expandFlag = !expandFlag;
                        });
                      }),
                  Row(
                    children: const [
                      Text('0g', style: TextStyle(fontWeight: FontWeight.w400)),
                      SizedBox(width: 10),
                      Text('0g', style: TextStyle(fontWeight: FontWeight.w400)),
                      SizedBox(width: 19),
                      Text('0g', style: TextStyle(fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Row(
                    children: const [
                      Text('protein', style: TextStyle(fontWeight: FontWeight.w400)),
                      SizedBox(width: 5),
                      Text('carbs', style: TextStyle(fontWeight: FontWeight.w400)),
                      SizedBox(width: 5),
                      Text('fat', style: TextStyle(fontWeight: FontWeight.w400)),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        ExpandableContainerWidget(
          expanded: expandFlag, index: widget.index,

          //child: const _BodyExpanded(),
        ),
        ProductList(listIndex: widget.index,),
      ],
    );
  }
}

class ListFoods extends StatefulWidget {
  final String title;

  const ListFoods({Key? key, required this.title}) : super(key: key);

  @override
  _ListFoodsState createState() => _ListFoodsState();
}

class _ListFoodsState extends State<ListFoods> {
  bool expandFlag = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      margin: const EdgeInsets.only(left: 10, right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.2,
            height: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Image(
              image: AssetImage('assets/ic_dinner.png'),
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 25),
              ),
              const SizedBox(height: 10),
              const Text(' 0 kcal')
            ],
          ),
          Column(
            children: [
              IconButton(
                  alignment: Alignment.topRight,
                  icon: Container(
                    alignment: Alignment.centerRight,
                    child: Center(
                      child: Icon(
                        expandFlag ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        size: 20.0,
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      expandFlag = !expandFlag;
                    });
                  }),
              Row(
                children: const [
                  Text('0g', style: TextStyle(fontWeight: FontWeight.w400)),
                  SizedBox(width: 10),
                  Text('0g', style: TextStyle(fontWeight: FontWeight.w400)),
                  SizedBox(width: 19),
                  Text('0g', style: TextStyle(fontWeight: FontWeight.w400)),
                ],
              ),
              Row(
                children: const [
                  Text('protein', style: TextStyle(fontWeight: FontWeight.w400)),
                  SizedBox(width: 5),
                  Text('carbs', style: TextStyle(fontWeight: FontWeight.w400)),
                  SizedBox(width: 5),
                  Text('fat', style: TextStyle(fontWeight: FontWeight.w400)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
