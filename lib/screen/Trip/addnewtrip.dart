import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:travel_manager/screen/Trip/Trip_screen.dart';
import 'package:travel_manager/screen/bootom_nav.dart';

class AddNewTrip extends StatefulWidget {
  @override
  _AddNewTripState createState() => _AddNewTripState();
}

class _AddNewTripState extends State<AddNewTrip> {
  TextEditingController _tripname = TextEditingController(text: "");
  TextEditingController _fromdate = TextEditingController(text: "");
  TextEditingController _todate = TextEditingController(text: "");
  TextEditingController _fromcity = TextEditingController(text: "");
  TextEditingController _tocity = TextEditingController(text: "");
  int daysInMonth(int month, int year) {
    int days = 28 +
        (month + (month / 8).floor()) % 2 +
        2 % month +
        2 * (1 / month).floor();
    return (isLeapYear(year) && month == 2) ? 29 : days;
  }

  bool isLeapYear(int year) =>
      ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0);

  bool isValiddate(String date) {
    if ((date[2] != '/') || (date[5] != '/') || (date.length != 10))
      return false;
    int day = int.parse(date.substring(0, 2));
    int month = int.parse(date.substring(3, 5));
    int year = int.parse(date.substring(6));
    if (((month >= 1) && (month <= 12)) &&
        ((day <= daysInMonth(month, year)) && (day > 0)))
      return true;
    else
      return false;
  }

  bool isCombinationValid(String date1, String date2) {
    int day1 = int.parse(date1.substring(0, 2));
    int month1 = int.parse(date1.substring(3, 5));
    int year1 = int.parse(date1.substring(6));
    int day2 = int.parse(date2.substring(0, 2));
    int month2 = int.parse(date2.substring(3, 5));
    int year2 = int.parse(date2.substring(6));
    if (year2 > year1)
      return true;
    else if (year2 == year1) {
      if (month2 > month1)
        return true;
      else if (month2 == month1) {
        if (day2 > day1) return true;
      }
    }
    return false;
  }

  showError(String errormessage, String mess) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('$mess'),
            content: Text(errormessage),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  Widget profileDetail(
    Widget icon,
    String heading,
    String hint,
  ) {
    TextEditingController _controller;
    if (heading == "Trip Name") _controller = _tripname;
    if (heading == 'Date from') _controller = _fromdate;
    if (heading == 'To Date') _controller = _todate;
    if (heading == 'From City') _controller = _fromcity;
    if (heading == 'To City') _controller = _tocity;
    return Padding(
      padding: EdgeInsets.only(top: 10.0, left: 25.0, right: 25.0),
      child: Container(
        height: 50.0,
        child: Padding(
          padding: EdgeInsets.only(left: 0.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      prefixIcon: icon,
                      labelText: '$heading',
                      hintText: '$hint'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
      ),
      resizeToAvoidBottomPadding: false,
      body: ListView(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              'assets/images/tm_logo_small.png',
            ),
            backgroundColor: Colors.transparent,
            radius: 80.0,
          ),
          Container(
            child: Column(
              children: [
                profileDetail(
                  Icon(Icons.public),
                  "Trip Name",
                  "Trip Name",
                ),
                profileDetail(Icon(Icons.date_range), "Date from", "dd/mm/yyy"),
                profileDetail(
                    Icon(Icons.calendar_today), "To Date", "dd/mm/yyyy"),
                profileDetail(Icon(Icons.location_pin), "From City", "City"),
                profileDetail(Icon(Icons.location_history), "To City", "City"),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.done,
          color: Colors.white,
        ),
        onPressed: () {
          var tripname = _tripname.text;
          var fromdate = _fromdate.text;
          var todate = _todate.text;
          var fromcity = _fromcity.text;
          var tocity = _tocity.text;
          print(fromdate);
          if (tripname.isEmpty ||
              fromdate.isEmpty ||
              todate.isEmpty ||
              fromcity.isEmpty ||
              tocity.isEmpty) {
            print("One More Field is empty");
            showError('One or More Field is empty', 'Error');
            return;
          } else {
            if (isValiddate(fromdate)) {
              if (isValiddate(todate)) {
                if (isCombinationValid(fromdate, todate)) {
                  print("combination correct");
                  var inputFormat = DateFormat("dd/MM/yyyy");
                  var date1 = inputFormat.parse(fromdate);
                  print(date1);
                  var inputFormat1 = DateFormat("dd/MM/yyyy");
                  var date2 = inputFormat1.parse(todate);
                  print(date2);
                  List<String> days = [];
                  for (int i = 0; i <= date2.difference(date1).inDays; i++) {
                    days.add(DateFormat("dd-MM-yyyy")
                        .format(date1.add(Duration(days: i))));
                  }
                  int numberofdays = days.length;

                  var pagaluser = FirebaseAuth.instance.currentUser;
                  FirebaseFirestore.instance
                      .collection("users")
                      .doc(pagaluser.uid)
                        ..set({
                          "check": "kuchh",
                        });

                  var firebaseUser = FirebaseAuth.instance.currentUser;
                  var ds = FirebaseFirestore.instance
                      .collection("users")
                      .doc(firebaseUser.uid)
                      .collection("trips")
                      .doc(tripname);
                  ds.set({
                    "trip name": "$tripname",
                    "from date": "$fromdate",
                    "to date": "$todate",
                    "from city": "$fromcity",
                    "to city": "$tocity",
                    "status": true,
                  }).then((_) {
                    showError('Trip Has Been Succesfully Created', 'Sucess');
                  });
                  ds
                      .collection("Flights")
                      .doc("check")
                      .set({"status": "false"});
                  ds.collection("hotel").doc("check").set({"status": "false"});
                  ds.collection("Train").doc("check").set({"status": "false"});
                  ds.collection("Bus").doc("check").set({"status": "false"});
                  for (int z = 0; z < numberofdays; z++) {
                    ds
                        .collection("overview")
                        .doc(days[z])
                        .set({"status": "false"});
                  }
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Trip();
                      },
                    ),
                  );

                  return;
                } else
                  print("combination incorrect");
                showError('Date Combination InCorrect', 'Error');
                return;
              } else
                print("invalid date 2");
              showError('To Date is invalid', 'Error');
              return;
            } else
              print("invalid date 1");
            showError('From Date is invalid', 'Error');
            return;
          }
        },
      ),
    );
  }
}
