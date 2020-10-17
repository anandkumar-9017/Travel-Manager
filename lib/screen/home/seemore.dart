import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/placesdetails.dart';

class SeeMore extends StatefulWidget {
  final String name;
  SeeMore({this.name});

  @override
  _SeeMoreState createState() => _SeeMoreState(name: name);
}

class _SeeMoreState extends State<SeeMore> {
  String name;
  _SeeMoreState({this.name});
  int press = 0;

  Widget icons() {
    if (press == 1) {
      return Icon(
        Icons.cancel,
        color: Colors.white,
      );
    } else {
      return Icon(
        Icons.search,
        color: Colors.white,
      );
    }
  }

  Widget title() {
    if (press == 1) {
      return TextField(
        decoration: InputDecoration(
          hintStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          isDense: true,
          hintText: "Search",
        ),
        style: TextStyle(
            color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w700),
      );
    } else {
      return Text(
        "$name",
        style: TextStyle(
            color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w700),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: title(),
        actions: [
          IconButton(
              icon: icons(),
              onPressed: () {
                setState(() {
                  if (press == 0)
                    press = 1;
                  else
                    press = 0;
                });
              }),
        ],
      ),
      body: Container(
          child: ListView(
        children: [
          PlacesDetails(),
          PlacesDetails(),
          PlacesDetails(),
          PlacesDetails(),
          PlacesDetails(),
          PlacesDetails()
        ],
      )),
    );
  }
}
