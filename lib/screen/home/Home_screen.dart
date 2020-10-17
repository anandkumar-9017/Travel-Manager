import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/horizontalList.dart';
import 'package:travel_manager/screen/home/seemore.dart';
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
            Stack(
              children: [
                Image.asset('asset/images/map.jpeg'),
                Positioned(
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  right: 15.0,
                  top: 40.0,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.room,
                            color: Colors.green,
                            size: 28.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                isDense: true,
                                hintText: 'Your Current Location',
                              ),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: custombutton(
                    Icon(
                      Icons.assignment,
                      size: 30.0,
                    ),
                    "About",
                  ),
                ),
                Expanded(
                  child: custombutton(
                    Icon(
                      Icons.museum,
                      size: 30.0,
                    ),
                    "Place to Visit",
                  ),
                ),
                Expanded(
                  child: custombutton(
                    Icon(
                      Icons.hotel,
                      size: 30.0,
                    ),
                    "Hotels",
                  ),
                ),
                Expanded(
                  child: custombutton(
                    Icon(
                      Icons.restaurant,
                      size: 30.0,
                    ),
                    "Restaurents",
                  ),
                ),
                Expanded(
                  child: custombutton(
                    Icon(
                      Icons.shopping_bag,
                      size: 30.0,
                    ),
                    "Shopping Places",
                  ),
                ),
                Expanded(
                  child: custombutton(
                    Icon(
                      Icons.train,
                      size: 30.0,
                    ),
                    "Transport",
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Places to Visit",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SeeMore(name: "Places to Visit");
                            },
                          ),
                        );
                      },
                      child: Text("See All",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          )))
                ],
              ),
            ),
            HorizontalList(),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hotels",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SeeMore(name: "Hotels");
                            },
                          ),
                        );
                      },
                      child: Text("See All",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          )))
                ],
              ),
            ),
            HorizontalList(),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Restaurents",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SeeMore(name: "Restaurents");
                            },
                          ),
                        );
                      },
                      child: Text("See All",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          )))
                ],
              ),
            ),
            HorizontalList(),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shopping Location",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SeeMore(name: "Shopping Location");
                            },
                          ),
                        );
                      },
                      child: Text("See All",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          )))
                ],
              ),
            ),
            HorizontalList(),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Transport",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SeeMore(name: "Transport");
                            },
                          ),
                        );
                      },
                      child: Text("See All",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          )))
                ],
              ),
            ),
            HorizontalList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
