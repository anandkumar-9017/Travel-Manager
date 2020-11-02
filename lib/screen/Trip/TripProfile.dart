import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_manager/screen/Trip/Transport/seetransport.dart';
import 'package:travel_manager/screen/Trip/hotels.dart';
import 'package:travel_manager/screen/Trip/hotels/seehotels.dart';

import 'package:travel_manager/screen/Trip/overviewlist.dart';
import 'package:travel_manager/screen/Trip/transport.dart';
import 'package:travel_manager/screen/bootom_nav.dart';
import 'package:travel_manager/services/fire.dart';

class TripProfile extends StatefulWidget {
  var name;
  TripProfile(name) {
    this.name = name;
  }

  @override
  _TripProfileState createState() => _TripProfileState(name);
}

class _TripProfileState extends State<TripProfile>
    with TickerProviderStateMixin {
  var name;
  var tripname;
  _TripProfileState(name) {
    this.name = name;
    tripname = this.name;
  }

  int h = 0;
  int f = 0;

  TabController tb;
  List<Widget> hotellist = List();
  List<Widget> transplist = List();
  List<Widget> overlist = List();
  void hotels() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    var collection = FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .collection("trips")
        .doc(name)
        .collection("hotel");
    var status = await collection.doc("check").get();
    var statusval = status.data()["status"];

    var datafetch = await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .collection("trips")
        .doc(name)
        .collection("hotel")
        .get();
    int len = datafetch.docs.length;
    for (int i = 0; i < len - 1; i++) {
      var hotelsdata = datafetch.docs[i].data();
      String name = hotelsdata["name"];
      String checkin = hotelsdata["checkin"];
      String checkout = hotelsdata["checkout"];
      String room = hotelsdata["room"];
      String keydata = hotelsdata["key"];
      print(keydata);
      hotellist.add(HotelList(
        i: i,
        name: name,
        checkin: checkin,
        checkout: checkout,
        room: room,
        keydata: keydata,
        tripname: this.name,
      ));
    }

    setState(() {
      h = 1;
    });
  }

  void flights() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    var datafetch = await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .collection("trips")
        .doc(tripname)
        .collection("Flights")
        .get();
    int len = datafetch.docs.length;
    print(len);
    print(tripname);
    if (len > 1) {
      transplist.add(Center(
        child: Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(
            "---------------Flights----------------",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ));
      for (int i = 0; i < len - 1; i++) {
        var flightsdata = datafetch.docs[i].data();
        var date = flightsdata["date"];
        var keydata = flightsdata["key"];
        var flightname = flightsdata["name"];
        var route = flightsdata["route"];
        var time = flightsdata["time"];
        var price = flightsdata["price"];

        print(tripname);
        transplist.add(TransportList(
          i: i,
          name: flightname,
          time: time,
          route: route,
          price: price,
          date: date,
          keydata: keydata,
          tripname: this.name,
        ));
      }
    }
    var datafetchtrain = await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .collection("trips")
        .doc(tripname)
        .collection("Train")
        .get();
    int len2 = datafetchtrain.docs.length;
    print(len2);
    print(tripname);
    if (len2 > 1) {
      transplist.add(Center(
        child: Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(
            "---------------Train----------------",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ));
      for (int i = 1; i < len2; i++) {
        var flightsdata = datafetchtrain.docs[i].data();
        var date = flightsdata["date"];
        var keydata = flightsdata["key"];
        var flightname = flightsdata["name"];
        var route = flightsdata["route"];
        var time = flightsdata["time"];
        var price = flightsdata["price"];

        print(tripname);
        transplist.add(TransportList(
          i: i,
          name: flightname,
          time: time,
          route: route,
          price: price,
          date: date,
          keydata: keydata,
          tripname: this.name,
        ));
      }
    }
    var datafetchbus = await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .collection("trips")
        .doc(tripname)
        .collection("Bus")
        .get();
    int len3 = datafetchbus.docs.length;
    print(len3);
    print(tripname);
    if (len3 > 1) {
      transplist.add(Center(
        child: Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(
            "---------------Bus----------------",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ));
      for (int i = 0; i < len3 - 1; i++) {
        var flightsdata = datafetchbus.docs[i].data();
        var date = flightsdata["date"];
        var keydata = flightsdata["key"];
        var flightname = flightsdata["name"];
        var route = flightsdata["route"];
        var time = flightsdata["time"];
        var price = flightsdata["price"];

        print(tripname);
        transplist.add(TransportList(
          i: i,
          name: flightname,
          time: time,
          route: route,
          price: price,
          date: date,
          keydata: keydata,
          tripname: this.name,
        ));
      }
    }

    setState(() {
      f = 1;
    });
  }

  Widget hotelwidget() {
    if (h == 1)
      return Container(
        child: ListView(
          children: hotellist,
        ),
      );
    else {
      return Text("Loading ..");
    }
  }

  Widget transportwidget() {
    if (f == 1)
      return Container(
        child: ListView(
          children: transplist,
        ),
      );
    else {
      return Text("Loading ..");
    }
  }

  /* List<Widget> transp() {
    for (var i = 1; i <= 6; i++) {
      transplist.add(TransportList(
        i: i, //tripname
      ));
    }
    return transplist;
  } */

  /*  Widget Transport() {
    /* return Container(
      child: ListView(
        children: transp(),
      ),
    ); */
  } */

  List<Widget> over() {
    for (var i = 1; i <= 6; i++) {
      overlist.add(Overview(
        i: i,
      ));
    }
    return overlist;
  }

  Widget OverView() {
    return Container(
      child: ListView(
        children: over(),
      ),
    );
  }

  @override
  void initState() {
    tb = TabController(
      length: 3,
      vsync: this,
    );
    hotels();
    flights();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(" TripName"),
        bottom: TabBar(
          tabs: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Hotels"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Transport"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Overview"),
            ),
          ],
          controller: tb,
        ),
      ),
      body: TabBarView(
        children: [
          hotelwidget(),
          transportwidget(),
          OverView(),
        ],
        controller: tb,
      ),
      bottomNavigationBar: BottomNav(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[900],
        onPressed: () {
          int tabindex = tb.index;
          if (tabindex == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SeeHotel(name: this.name);
                },
              ),
            );
          } else if (tabindex == 1) {
            print(this.name);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SeeTransport(name: this.name);
                },
              ),
            );
          } else if (tabindex == 2) {
            print("abhi nahi bna");
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
