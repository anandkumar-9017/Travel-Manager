import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/placesdetails.dart';

class SeeMoreShopes extends StatefulWidget {
  final String name;

  SeeMoreShopes({this.name});

  @override
  _SeeMoreShopesState createState() => _SeeMoreShopesState(name);
}

class _SeeMoreShopesState extends State<SeeMoreShopes> {
  String name;
  QuerySnapshot hotels;
  var i = 3;

  _SeeMoreShopesState(name) {
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
              hotels.docs[index].data()['pricing'],
              hotels.docs[index].data()['speciality'],
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
        .collection('Shopping Places')
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
