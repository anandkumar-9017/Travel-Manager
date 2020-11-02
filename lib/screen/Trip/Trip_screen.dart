import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_manager/screen/Trip/addnewtrip.dart';
import 'package:travel_manager/screen/Trip/listTripItem.dart';
import 'package:travel_manager/screen/bootom_nav.dart';

class Trip extends StatefulWidget {
  @override
  _TripState createState() => _TripState();
}

class _TripState extends State<Trip> with TickerProviderStateMixin {
  TabController tb;
  QuerySnapshot tripquery;

  List<Widget> upcomming = List();
  List<Widget> completed = List();
  List<Widget> cancel = List();
  int u = 0;
  int j = 0;
  int k = 0;

  bool status(String date) {
    var now = DateTime.now();
    print(now.year);
    print(now.month);
    print(now.day);
    int day = int.parse(date.substring(0, 2));
    int month = int.parse(date.substring(3, 5));
    int year = int.parse(date.substring(6));

    if (year > now.year)
      return true;
    else if (year == now.year) {
      if (month > now.month)
        return true;
      else if (month == now.month) {
        if (day > now.day) return true;
      }
    }
    return false;
  }

  void uplist() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    tripquery = await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .collection("trips")
        .get();

    int len = tripquery.docs.length;
    int temp = 0;
    for (var i = 0; i < len; i++) {
      var status2 = tripquery.docs[i].data()['status'];
      var fromdate = tripquery.docs[i].data()['from date'];
      var todate = tripquery.docs[i].data()['to date'];
      var name = tripquery.docs[i].data()['trip name'];
      var tocity = tripquery.docs[i].data()['to city'];
      String t = status2.toString();
      if (t == 'true') if ((status(fromdate)) || (status(todate)))
        upcomming.add(ListTrip(
          i: ++temp,
          name: name,
          fromdate: fromdate,
          todate: todate,
          tocity: tocity,
        ));
    }
    setState(() {
      u = 1;
    });
  }

  void complist() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    tripquery = await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .collection("trips")
        .get();
    int temp = 0;
    int len = tripquery.docs.length;
    for (var i = 0; i < len; i++) {
      var status2 = tripquery.docs[i].data()['status'];
      var fromdate = tripquery.docs[i].data()['from date'];
      var todate = tripquery.docs[i].data()['to date'];
      var name = tripquery.docs[i].data()['trip name'];
      var tocity = tripquery.docs[i].data()['to city'];
      String t = status2.toString();
      if (t == 'true') if (!((status(fromdate)) || (status(todate))))
        completed.add(ListTrip(
          i: ++temp,
          name: name,
          fromdate: fromdate,
          todate: todate,
          tocity: tocity,
        ));
    }
    setState(() {
      j = 1;
    });
  }

  void cancellist() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    tripquery = await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .collection("trips")
        .get();

    int len = tripquery.docs.length;
    int temp = 0;
    for (var i = 0; i < len; i++) {
      var status2 = tripquery.docs[i].data()['status'];
      var fromdate = tripquery.docs[i].data()['from date'];
      var todate = tripquery.docs[i].data()['to date'];
      var name = tripquery.docs[i].data()['trip name'];
      var tocity = tripquery.docs[i].data()['to city'];
      String t = status2.toString();
      if (t == 'false')
        cancel.add(ListTrip(
          i: ++temp,
          name: name,
          fromdate: fromdate,
          todate: todate,
          tocity: tocity,
        ));
    }
    setState(() {
      k = 1;
    });
  }

  @override
  void initState() {
    tb = TabController(
      length: 3,
      vsync: this,
    );
    uplist();
    complist();
    cancellist();

    super.initState();
  }

  Widget upcomingscreen() {
    if (u == 1) {
      return Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: upcomming,
        ),
      );
    } else
      return Text("Loading ....");
  }

  Widget completedscreen() {
    if (j == 1) {
      return Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: completed,
        ),
      );
    } else
      return Text("Loading ....");
  }

  Widget cancelscreen() {
    if (k == 1) {
      return Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: cancel,
        ),
      );
    } else
      return Text("Loading ....");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(" My Trips"),
        actions: [
          IconButton(
              icon: Icon(Icons.cached),
              onPressed: () {
                int uplen = upcomming.length;
                upcomming.removeRange(0, uplen);
                int complen = completed.length;
                completed.removeRange(0, complen);
                int cancellen = cancel.length;
                cancel.removeRange(0, cancellen);
                uplist();
                complist();
                cancellist();
                setState(() {
                  u = 0;
                  k = 0;
                  j = 0;
                });
              })
        ],
        bottom: TabBar(
          tabs: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Upcomming"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Completed"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Cancelled"),
            ),
          ],
          controller: tb,
        ),
      ),
      body: TabBarView(
        children: [
          upcomingscreen(),
          completedscreen(),
          cancelscreen(),
        ],
        controller: tb,
      ),
      bottomNavigationBar: BottomNav(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[900],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddNewTrip();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
