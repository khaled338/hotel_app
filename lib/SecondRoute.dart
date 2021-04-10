
import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hotel_reservation/DAO.dart';
import 'package:hotel_reservation/DAO.dart';
import 'package:hotel_reservation/Entity.dart';
import 'package:hotel_reservation/database.dart';
import 'package:hotel_reservation/main.dart';
import 'package:intl/intl.dart';

import 'package:floor/floor.dart';

import 'DAO.dart';


class SecondRoute extends StatelessWidget {
  final HotelDao dao ;
  SecondRoute ({this.dao}) ;

  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage1(title: 'Flutter Demo Home Page',),
    );
  }
  }

class MyHomePage1 extends StatefulWidget {
  MyHomePage1({Key key, this.title,}) : super(key: key);
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
        ListItem(100, "Ramses Hilton Hotel & Casino",800),
        ListItem(200, "Four Seasons Hotel Cairo at Nile Plaza",900),
        ListItem(300, "Safir Hotel Cairo",600),
        ListItem(400, "Pyramisa Suites Hotel Cairo",700)
      ];
      int _value = 1;
      List<ListItem1> _dropdownItems1 = [
        ListItem1(1, "1 day"),
        ListItem1(2, "2 days"),
        ListItem1(3, "3 days"),
        ListItem1(7, "1 week(7days)"),
        ListItem1(30, "1 month(30days)"),

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

      // Future<List<int>> addUsers(UserHotel db) async {
      //   UserHotel firstUser = UserHotel(name: "peter", age: 24, country: "Lebanon");
      //   UserHotel secondUser = UserHotel(name: "john", age: 31, country: "United Kingdom");
      //   return await db.userDAO.inserUser([firstUser, secondUser]);
      // }
      // UserHotel.fromMap(Map<String, dynamic> res)
      //      : _value= res["Number of days"],
      //        _itemSelected= res["Name"],
      //        _value2= res["Number of individuals"],
      //        _selectedDate = res["Date"];


       Map<String, Object> toMap() {
         return {'Number of days':_value,'Name':_itemSelected , 'Number of individuals':_value2 , 'Date': _selectedDate, };
       }




       Future<List<UserHotel>> retrieveUsers() async {
         final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

         return await database.hotelDao.findAllData();
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
                        _selectDate(context);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("Total price: ${_itemSelected.price*_value2*_value}"),
        ]
          ),
          Container(
            margin: EdgeInsets.all(25),
            child: FlatButton(
              child: Text('Save', style: TextStyle(fontSize: 20.0),),
              color: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                  return toMap();
                });
              },

            ),
          ),
          Column(
              children:toMap
              .map((element) => Card(
                child: Column(
                  children: <Widget>[
                    Text(element,
                        style: TextStyle(color: Colors.deepPurple))
                  ],
                ),
              ))
                  .toListView.builder()),


              FutureBuilder(
                future: this.retrieveUsers(),
                builder: (BuildContext context, AsyncSnapshot<List<UserHotel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Dismissible(
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Icon(Icons.delete_forever),
                          ),
                          key: ValueKey<int>(snapshot.data[index].id),
                          onDismissed: (DismissDirection direction) async {
                            await this
                                .database
                                .hotelDao
                                .deleteUserHotel;
                            setState(() {
                              snapshot.data.remove(snapshot.data[index]);
                            });
                          },
                          child: Card(
                              child: ListTile(
                                contentPadding: EdgeInsets.all(8.0),
                                title: Text(snapshot.data[index].name),
                                subtitle: Text(snapshot.data[index].numberOfDays.toString()),
                              )),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
        ]

      ),



        );

    }
}
class ListItem {
  int value;
  String name;
  int price;

  ListItem(this.value, this.name,this.price);
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


