import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandablePanel extends StatefulWidget {
  const ExpandablePanel({Key? key}) : super(key: key);

  @override
  State<ExpandablePanel> createState() => _ExpandablePanelState();
}

class Item {
  Item({
    required this.headerValue,
    this.isExpanded = false,
  });

  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  List<String> meal = ['Breckfast', 'luch', 'dinner', 'snacks'];

  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: '${meal[index]} ',
    );
  });
}

class _ExpandablePanelState extends State<ExpandablePanel> {
  final List<Item> _data = generateItems(4);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return _Panel(nameFood: item.headerValue);

              //ListTile(
            //               //aqui va la pantalla visual
            //               title: Text(item.headerValue),
            //             );
          },
          body: _DataExpansion(),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}

class _Panel extends StatelessWidget {
  final String nameFood;

  const _Panel({Key? key, required this.nameFood}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image(image: AssetImage('assets/food.png'), fit: BoxFit.fill,),
        ),
        Column(
          children: [
            Text(nameFood, style: TextStyle(fontSize: 15),),
            Text('0g'),
          ],
        ),
        _textPanel()
      ],
    );
  }
}

class _DataExpansion extends StatelessWidget {
  const _DataExpansion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        border: Border.all(width: 3.0, color: Colors.green),
      ),
      height: 90,
      width: 330,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
          SizedBox(width: 20),
          Text('Add food')
        ],
      ),
    );
  }
}

class _textPanel extends StatelessWidget {
  const _textPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: const [
        Text('protein'),
        SizedBox(width: 5),
        Text('carbs'),
        SizedBox(width: 5),
        Text('fat')

        ],
    );
  }
}
