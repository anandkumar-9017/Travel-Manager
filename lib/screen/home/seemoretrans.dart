import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/transportdetails.dart';

class SeeMoretrans extends StatefulWidget {
  final String name;
  var show;

  SeeMoretrans({this.name, this.show});
  @override
  _SeeMoretransState createState() => _SeeMoretransState(name, show);
}

class _SeeMoretransState extends State<SeeMoretrans> {
  String name;
  var show;
  QuerySnapshot flights;
  QuerySnapshot bus;
  QuerySnapshot train;
  var i = 3;
  var load1 = 0;
  var load2 = 0;
  var load3 = 0;

  _SeeMoretransState(name, show) {
    this.name = name;
    this.show = show;
  }
  List<Widget> flightfunct() {
    if (flights != null) {
      List<Widget> flightlist = List();
      flightlist.add(Center(
        child: Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(
            "----------------Flights---------------",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ));
      int len = flights.docs.length;
      for (int i = 0; i < len; i++) {
        flightlist.add(Transportdetail(
          flights.docs[i].data()['days'],
          flights.docs[i].data()['duration'],
          flights.docs[i].data()['fromtime'],
          flights.docs[i].data()['fromcity'],
          flights.docs[i].data()['tocity'],
          flights.docs[i].data()['totime'],
          flights.docs[i].data()['stop'],
          flights.docs[i].data()['name'],
          flights.docs[i].data()['price'],
        ));
      }
      return flightlist;
    }
  }

  List<Widget> trainfunct() {
    if (flights != null) {
      List<Widget> trainlist = List();
      trainlist.add(Center(
        child: Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(
            "----------------Trains---------------",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ));
      int len = train.docs.length;
      for (int i = 0; i < len; i++) {
        trainlist.add(Transportdetail(
          train.docs[i].data()['days'],
          train.docs[i].data()['duration'],
          train.docs[i].data()['fromtime'],
          train.docs[i].data()['fromcity'],
          train.docs[i].data()['tocity'],
          train.docs[i].data()['totime'],
          train.docs[i].data()['stop'],
          train.docs[i].data()['name'],
          train.docs[i].data()['price'],
        ));
      }
      return trainlist;
    }
  }

  List<Widget> busfunct() {
    if (flights != null) {
      List<Widget> buslist = List();
      buslist.add(Center(
        child: Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(
            "---------------Buses----------------",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ));
      int len = bus.docs.length;
      for (int i = 0; i < len; i++) {
        buslist.add(Transportdetail(
          bus.docs[i].data()['days'],
          bus.docs[i].data()['duration'],
          bus.docs[i].data()['fromtime'],
          bus.docs[i].data()['fromcity'],
          bus.docs[i].data()['tocity'],
          bus.docs[i].data()['totime'],
          bus.docs[i].data()['stop'],
          bus.docs[i].data()['name'],
          bus.docs[i].data()['price'],
        ));
      }
      return buslist;
    }
  }

  void funct() async {
    flights = await FirebaseFirestore.instance
        .collection("fetch details")
        .doc("Allahabad")
        .collection('Flights')
        .get();
    train = await FirebaseFirestore.instance
        .collection("fetch details")
        .doc("Allahabad")
        .collection('Train')
        .get();
    bus = await FirebaseFirestore.instance
        .collection("fetch details")
        .doc("Allahabad")
        .collection('Bus')
        .get();
    setState(() {
      load1 = 1;
      load2 = 1;
      load3 = 1;
      flights = flights;
      train = train;
      bus = bus;
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

  Widget flightwidg() {
    if (load1 == 1) {
      if ((show == 1) || (show == 4)) {
        return Container(
            child: Column(
          children: flightfunct(),
        ));
      } else
        return Text(" ");
    } else {
      return Text("loading..");
    }
  }

  Widget trainwidg() {
    if (load2 == 1) {
      if ((show == 2) || (show == 4)) {
        return Container(
            child: Column(
          children: trainfunct(),
        ));
      } else
        return Text(" ");
    } else {
      return Text("loading...");
    }
  }

  Widget buswidg() {
    if (load3 == 1) {
      if ((show == 3) || (show == 4)) {
        return Container(
            child: Column(
          children: busfunct(),
        ));
      } else
        return Text(" ");
    } else {
      return Text("loading...");
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
      body: ListView(
        children: [
          flightwidg(),
          trainwidg(),
          buswidg(),
        ],
      ),
    );
  }
}
