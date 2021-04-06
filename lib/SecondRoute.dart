
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage1(title: 'Flutter Demo Home Page'),
    );
  }
  }

class MyHomePage1 extends StatefulWidget {
  MyHomePage1({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState1 createState() => _MyHomePageState1();

}

class _MyHomePageState1 extends State<MyHomePage1> {
      //Your code here

      List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
      ListItem _itemSelected;
      var _selectedDate = 'Tap to select date';

      List<DropdownMenuItem<ListItem>> items = List();
      List<ListItem> _dropdownItems = [
        ListItem(1, "Ramses Hilton Hotel & Casino"),
        ListItem(2, "Four Seasons Hotel Cairo at Nile Plaza"),
        ListItem(3, "Safir Hotel Cairo"),
        ListItem(4, "Pyramisa Suites Hotel Cairo")
      ];
      int _value = 1;
      List<ListItem1> _dropdownItems1 = [
        ListItem1(1, "1 day"),
        ListItem1(2, "2 days"),
        ListItem1(3, "3 days"),
        ListItem1(4, "1 week"),
        ListItem1(5, "1 month"),

      ];
      int _value2 = 1;
      List<ListItem2> _dropdownItems2 = [
        ListItem2(1, "1 person"),
        ListItem2(2, "2 person"),
        ListItem2(3, "3 person"),
        ListItem2(4, "4 person"),


      ];

      void initState() {
        super.initState();
        _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);
        _itemSelected = _dropdownMenuItems[1].value;
      }
      Future<void> _selectDate(BuildContext context) async {
        final DateTime d = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2015),
          lastDate: DateTime(2022),
        );
        if (d != null)
          setState(() {
            _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
          });

      }


      List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
        List<DropdownMenuItem<ListItem>> items = List();
        for (ListItem listItem in listItems) {
          items.add(
            DropdownMenuItem(
              child: Text(listItem.name),
              value: listItem,
            ),
          );
        }
        return items;
      }
      @override
      Widget build(BuildContext context) {


        return Scaffold(
      appBar: AppBar
      (title: Text("Second Route"),),

      body:
      Column(
        children: <Widget>[
          Text("Please Choose The Name Hotel"),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  border: Border.all()),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: _itemSelected,
                    items: _dropdownMenuItems,
                    onChanged: (value) {
                      setState(() {
                        _itemSelected = value;
                      });
                    }),
              ),
            ),
          ),
          Text("We have selected ${_itemSelected.name}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 1.0, color: Colors.black),
                    left: BorderSide(width: 1.0, color: Colors.black),
                    right: BorderSide(width: 1.0, color: Colors.black),
                    bottom: BorderSide(width: 1.0, color: Colors.black),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      child: Text(
                          _selectedDate,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFF000000))
                      ),
                      onTap: ()async{
                        await _selectDate(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.calendar_today),
                      tooltip: 'Tap to open date picker',
                      onPressed: () {
                         showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2015, 8),
                          lastDate: DateTime(2101),

                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("How long are you going to be there?"),

           Container(
           padding: EdgeInsets.all(20),
          child:DropdownButton(
            value: _value,
            items: _dropdownItems1.map((ListItem1 item) {
              return DropdownMenuItem<int>(
                child: Text(item.name1),
                value: item.value1,
              );
            }).toList(),
            onChanged: (value1) {
              setState(() {
                _value = value1;
              });
            },
          ),
        )

              ]
           ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text("How many people?"),

                Container(
                  padding: EdgeInsets.all(20),
                  child:DropdownButton(
                    value: _value2,
                    items: _dropdownItems2.map((ListItem2 item) {
                      return DropdownMenuItem<int>(
                        child: Text(item.name2),
                        value: item.value2,
                      );
                    }).toList(),
                    onChanged: (value2) {
                      setState(() {
                        _value2 = value2;
                      });
                    },
                  ),
                )

              ]
          ),



        ],

      ),



        );

    }
}
class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
class ListItem1{
  int value1;
  String name1;
  ListItem1(this.value1, this.name1);
}
class ListItem2{
  int value2;
  String name2;
  ListItem2(this.value2, this.name2);
}
