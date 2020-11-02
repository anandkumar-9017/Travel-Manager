import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TransportTripdetail extends StatefulWidget {
  var days;
  var duration;
  var fromtime;
  var fromcity;
  var tocity;
  var totime;
  var stop;
  var name;
  var price;
  var keydata;
  var tripname;
  var type;

  TransportTripdetail(
    var days,
    var duration,
    var fromtime,
    var fromcity,
    var tocity,
    var totime,
    var stop,
    var name,
    var price,
    var keydata,
    var tripname,
    var type,
  ) {
    this.days = days;
    this.duration = duration;
    this.fromcity = fromcity;
    this.tocity = tocity;
    this.totime = totime;
    this.fromtime = fromtime;
    this.name = name;
    this.price = price;
    this.stop = stop;
    this.keydata = keydata;
    this.tripname = tripname;
    this.type = type;
  }
  @override
  _TransportTripdetailState createState() => _TransportTripdetailState(
        days,
        duration,
        fromtime,
        fromcity,
        tocity,
        totime,
        stop,
        name,
        price,
        keydata,
        tripname,
        type,
      );
}

class _TransportTripdetailState extends State<TransportTripdetail> {
  var days;
  var duration;
  var fromtime;
  var fromcity;
  var tocity;
  var totime;
  var stop;
  var name;
  var price;
  var keydata;
  var tripname;
  var type;

  _TransportTripdetailState(
    var days,
    var duration,
    var fromtime,
    var fromcity,
    var tocity,
    var totime,
    var stop,
    var name,
    var price,
    var keydata,
    var tripname,
    var type,
  ) {
    this.days = days;
    this.duration = duration;
    this.fromcity = fromcity;
    this.tocity = tocity;
    this.totime = totime;
    this.fromtime = fromtime;
    this.name = name;
    this.price = price;
    this.stop = stop;
    this.keydata = keydata;
    this.tripname = tripname;
    this.type = type;
  }
  TextEditingController _date = TextEditingController(text: "");
  _showDialog() async {
    await showDialog<String>(
      context: context,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: new Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: new TextField(
                controller: _date,
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: 'date', hintText: 'dd/mm/yyyy'),
              ),
            ),
          ],
        ),
        actions: <Widget>[
          new FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                return;
              }),
          new FlatButton(
              child: const Text('SAVE'),
              onPressed: () async {
                var date = _date.text;
                var firebaseUser = FirebaseAuth.instance.currentUser;
                await FirebaseFirestore.instance
                    .collection("users")
                    .doc(firebaseUser.uid)
                    .collection("trips")
                    .doc(tripname)
                    .collection(type)
                    .doc(keydata)
                    .set({
                  "date": date,
                  "key": keydata,
                  "route": "$fromcity to $tocity",
                  "time": "$fromtime to $totime",
                  "price": "$price",
                  "name": name,
                }).then((_) {
                  print("likh gaya");

                  Navigator.of(context, rootNavigator: true).pop();
                });
              })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(tripname);
        print(keydata);
        print(type);
        _showDialog();
      },
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 15.0),
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
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14.0),
                    child: Text(
                      name,
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 14),
                          child: Icon(Icons.flight),
                        ),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fromtime,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    fromcity,
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ],
                              )),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              duration,
                              style: TextStyle(fontSize: 10),
                            ),
                            Divider(
                              thickness: 3.0,
                              height: 8.0,
                            ),
                            Text(
                              "$stop stop",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        )),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    totime,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    tocity,
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ],
                              )),
                        ),
                        Expanded(
                            child: Center(
                          child: Text(
                            "Rs $price",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
