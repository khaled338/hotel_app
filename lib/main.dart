import 'package:flutter/material.dart';

import 'SecondRoute.dart';

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
  List<String> notes = [
    "Ramses Hilton Hotel & Casino               Time:12:34 AM/Date:5 July 2021",
    "Four Seasons Hotel Cairo at Nile Plaza               Time:09:34 PM/Date:5 Oct 2021",
    "Safir Hotel Cairo                         Time:06:34 PM/Date:5 May 2021",
    "Pyramisa Suites Hotel Cairo               Time:05:34 PM/Date:5 Jan 2021",
    "Cairo Marriott Hotel & Omar Khayyam                Time:02:34 AM/Date:5 Aug 2021",
    "Conrad Cairo Hotel & Casino               Time:03:24 PM/Date:5 Sep 2021",
    "Osiris Hotel                                       Time:07:50 AM/Date:5 Apr 2021",
  ];


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


            ListView.builder(
            itemCount: notes.length,
          itemBuilder: (context, pos) {
          return Padding(

          padding: EdgeInsets.only(bottom: 16.0),
          child: Card(

          color: Colors.white,
          child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          child: Text(notes[pos], style: TextStyle(
          fontSize: 18.0,
          height: 1.6,

                ),),
              ),
             ),
          );
          },),




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
        onPressed:() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute()),

          );
        },
        child: new Icon(Icons.navigate_next), // This trailing comma makes auto-formatting nicer for build methods.
    ),
    );
  }
}
