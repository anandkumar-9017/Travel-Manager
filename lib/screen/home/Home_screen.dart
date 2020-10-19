import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/headinglist.dart';
import 'package:travel_manager/screen/home/horizontalList.dart';
import 'package:travel_manager/screen/home/seemore.dart';
import 'package:travel_manager/screen/home/iconbar.dart';
import 'package:travel_manager/screen/home/stack.dart';
import 'package:travel_manager/screen/bootom_nav.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
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
  Widget custombutton(Widget icont, String screen) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return SeeMore(name: "$screen");
            },
          ),
        );
      },
      child: icont,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: ListView(
          children: [
            StackBar(),
            IconBar(),
            HeadingList(heading: "Places to visit"),
            HorizontalList(),
            HeadingList(heading: "Hotel"),
            HorizontalList(),
            HeadingList(heading: "Restaurents"),
            HorizontalList(),
            HeadingList(heading: "Shopping Places"),
            HorizontalList(),
            HeadingList(heading: "Transport"),
            HorizontalList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
