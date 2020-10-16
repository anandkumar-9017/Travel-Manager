import 'package:flutter/material.dart';
import 'package:travel_manager/screen/Forum_screen.dart';
import 'package:travel_manager/screen/Profile_screen.dart';
import 'package:travel_manager/screen/Trip_screen.dart';
import 'package:travel_manager/screen/bootom_nav.dart';

import 'package:travel_manager/screen/horizontalList.dart';



class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget custombutton(Widget icont) {
    return FlatButton(
      onPressed: () {},
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
                Image.asset('assets/images/map.jpeg'),
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
                  child: custombutton(Icon(
                    Icons.assignment,
                    size: 30.0,
                    color: Colors.white,
                  )),
                ),
                Expanded(
                  child: custombutton(Icon(
                    Icons.hotel,
                    size: 30.0,
                    color: Colors.white,
                  )),
                ),
                Expanded(
                  child: custombutton(Icon(
                    Icons.hotel,
                    size: 30.0,
                    color: Colors.white,
                  )),
                ),
                Expanded(
                  child: custombutton(Icon(
                    Icons.restaurant,
                    size: 30.0,
                    color: Colors.white,
                  )),
                ),
                Expanded(
                  child: custombutton(Icon(
                    Icons.shop,
                    size: 30.0,
                    color: Colors.white,
                  )),
                ),
                Expanded(
                  child: custombutton(Icon(
                    Icons.train,
                    size: 30.0,
                    color: Colors.white,
                  )),
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text("See All",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                      onPressed: () {},
                      child: Text("See All",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ),
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                      onPressed: () {},
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
                    "Shopping Malls",
                    style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                  onPressed: () {},
                  child: Text("See All",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
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
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text("See All",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            HorizontalList(),
          ],
        ),
      ),
      bottomNavigationBar:BottomNav(),
    );
  }
}
