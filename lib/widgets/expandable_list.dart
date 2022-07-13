import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const styleText = TextStyle(fontWeight: FontWeight.w400, color: Colors.white);

class Expandablewidget extends StatefulWidget {
  @override
  State<Expandablewidget> createState() => _ExpandablewidgetState();
}

class Item {
  Item({
    required this.headerValue,
  });

  String headerValue;
}

class _ExpandablewidgetState extends State<Expandablewidget> {
  @override
  Widget build(BuildContext context) {
    final List<String> meal = ['Breckfast', 'luch', 'dinner', 'snacks'];

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return ExpandableListView(title: " ${meal[index]}");
      },
      itemCount: meal.length,
    );
  }
}

class ExpandableListView extends StatefulWidget {
  final String title;

  const ExpandableListView({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _ExpandableListViewState createState() => _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  bool expandFlag = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 1.0,
        left: 5,
        right: 5,
      ),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(5),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Image(
                    image:  AssetImage('assets/ic_dinner.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 25),
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
                              expandFlag ? Icons.keyboard_arrow_up :
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
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
                        Text('0g', style: styleText),
                        SizedBox(width: 10),
                        Text('0g', style: styleText),
                        SizedBox(width: 19),
                        Text('0g', style: styleText),
                      ],
                    ),
                    Row(
                      children: const [
                        Text('protein', style: styleText),
                        SizedBox(width: 5),
                        Text('carbs', style: styleText),
                        SizedBox(width: 5),
                        Text('fat', style: styleText),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          ExpandableContainer(
            expanded: expandFlag,
            child: const _BodyExpanded(),
          )
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  ExpandableContainer({
    Key? key,
    required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 70.0,
    this.expanded = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth * 0.9,
      height: expanded ? expandedHeight : collapsedHeight,
      child: Container(
        child: child,
        //decoration:  BoxDecoration(border:  Border.all(width: 3.0,)),
      ),
    );
  }
}

class _BodyExpanded extends StatelessWidget {
  const _BodyExpanded({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        border: Border.all(width: 3.0, color: Colors.green),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, 'searchFood'),
            child: Text(
              "+",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 20,
              ),
            ),
          ),
          const Text(
            "Add food",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
