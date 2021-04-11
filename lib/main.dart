import 'package:flutter/material.dart';

import 'Entity.dart';
import 'SecondRoute.dart';
import 'database.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<UserHotel> notes = [

  ];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{

      await getAllData();
    });

  }

Future getAllData() async {
     notes.clear();
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  List<UserHotel> aList=await database.hotelDao.findAllData();
  for(int i=0;i<aList.length;i++)
  {
    setState(() {
      notes.add(aList[i]);
    });
  }
}

  // "Ramses Hilton Hotel & Casino               Time:12:34 AM/Date:5 July 2021",
  // "Four Seasons Hotel Cairo at Nile Plaza               Time:09:34 PM/Date:5 Oct 2021",
  // "Safir Hotel Cairo                         Time:06:34 PM/Date:5 May 2021",
  // "Pyramisa Suites Hotel Cairo               Time:05:34 PM/Date:5 Jan 2021",
  // "Cairo Marriott Hotel & Omar Khayyam                Time:02:34 AM/Date:5 Aug 2021",
  // "Conrad Cairo Hotel & Casino               Time:03:24 PM/Date:5 Sep 2021",
  // "Osiris Hotel                                       Time:07:50 AM/Date:5 Apr 2021",
  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body:


            Container(

              child: ListView.builder(
              itemCount: notes.length,
          itemBuilder: (context, pos) {


            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
              key: Key(notes[pos].id.toString()),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction)async {
                // Remove the item from the data source.

                final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

                final hotelDao = database.hotelDao;
                hotelDao.deleteUserHotel(notes[pos]);
                String name =notes[pos].name;
                setState(() {
                  notes.removeAt(pos);

                });
                // Then show a snackbar.
                ScaffoldMessenger.of(context)
                   .showSnackBar(SnackBar(content: Text("${name} reservation is deleted.")));
              },
              // Show a red background as the item is swiped away.
              background: Container(color: Colors.red),
              child:





           Padding(

          padding: EdgeInsets.only(bottom: 16.0),
          child: Card(

          color: Colors.white,
          child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Column(
              children: [

                Text('Hotel Name : ${notes[pos].name}', style: TextStyle(
                fontSize: 18.0,
                height: 1.6,

                      ),),
                Text('Date : ${notes[pos].selectedDate}', style: TextStyle(
                  fontSize: 18.0,
                  height: 1.6,

                ),),
                Text('NumberOfDays : ${notes[pos].numberOfDays.toString()}', style: TextStyle(
                  fontSize: 18.0,
                  height: 1.6,

                ),),
                Text('NumberOfPerson : ${notes[pos].numberOfPerson.toString()}', style: TextStyle(
                  fontSize: 18.0,
                  height: 1.6,

                ),),

                Text('Price : ${notes[pos].price.toString()}', style: TextStyle(
                  fontSize: 18.0,
                  height: 1.6,

                ),),
              ],

          ),
                ),
               ),
           )
          );
          },),
            ),




      //child: Column(
          
        //  mainAxisAlignment: MainAxisAlignment.center,
          //children: <Widget>[
            //Text(
              //'You have pushed the button this many times:',
            //),
            //Text(
              //'$_counter',
              //style: Theme.of(context).textTheme.headline4,
            //),
          //],
        //),
      //),
      floatingActionButton: new FloatingActionButton(
        onPressed:()async {
        var result=await  Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),

          );
        if(result!=null)
          {
            await getAllData();
          }
        },
        child: new Icon(Icons.navigate_next), // This trailing comma makes auto-formatting nicer for build methods.
    ),
    );
  }
}
