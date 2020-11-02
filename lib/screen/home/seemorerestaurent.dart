import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/placesdetails.dart';

class SeeMoreRes extends StatefulWidget {
  final String name;

  SeeMoreRes({this.name});

  @override
  _SeeMoreResState createState() => _SeeMoreResState(name);
}

class _SeeMoreResState extends State<SeeMoreRes> {
  String name;
  QuerySnapshot hotels;
  var i = 3;

  _SeeMoreResState(name) {
    this.name = name;
  }

  Widget funct1() {
    if (hotels != null)
      return ListView.builder(
        itemCount: hotels.docs.length,
        itemBuilder: (context, int index) {
          return PlacesDetails(
              name,
              hotels.docs[index].data()['key'],
              hotels.docs[index].data()['name'],
              hotels.docs[index].data()['veg'] +
                  ' ' +
                  hotels.docs[index].data()['type'],
              hotels.docs[index].data()['location'],
              hotels.docs[index].data()['imagelink']);
        },
      );
    else
      return Text('aa raha hai');
  }

  void funct() async {
    hotels = await FirebaseFirestore.instance
        .collection("fetch details")
        .doc("Allahabad")
        .collection('Restaurents')
        .get();

    setState(() {
      hotels = hotels;
    });
  }

  @override
  void initState() {
    funct();
    super.initState();
  }

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
        child: funct1(),
      ),
    );
  }
}
