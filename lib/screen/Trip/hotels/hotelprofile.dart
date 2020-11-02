import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_manager/screen/Trip/TripProfile.dart';

import 'package:travel_manager/screen/home/seemorehotel.dart';

class HotelProfile extends StatefulWidget {
  var keydata;
  var tripname;
  HotelProfile(var keydata, var tripname) {
    this.keydata = keydata;
    this.tripname = tripname;
  }
  @override
  _HotelProfileState createState() => _HotelProfileState(keydata, tripname);
}

class _HotelProfileState extends State<HotelProfile> {
  var keydata;
  var tripname;
  var about;
  var location;
  var price;
  var name;
  var rating;
  var link;
  var imagelink;
  var fromdate;
  var todate;
  var room;
  int load = 0;
  int r = 0, done = 0;
  TextEditingController _fromdate = TextEditingController(text: "");
  TextEditingController _todate = TextEditingController(text: "");
  TextEditingController _room = TextEditingController(text: "");

  _HotelProfileState(var keydata, var tripname) {
    this.keydata = keydata;
    this.tripname = tripname;
  }

  var hotels;
  @override
  void initState() {
    funct();
    super.initState();
  }

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
                controller: _fromdate,
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: 'Checkin date', hintText: 'dd/mm/yyyy'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: new TextField(
                controller: _todate,
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: 'Checkout date', hintText: 'dd/mm/yyyy'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: new TextField(
                controller: _room,
                autofocus: true,
                decoration:
                    new InputDecoration(labelText: 'Room', hintText: 'room'),
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
                var room = _room.text;
                var checkin = _fromdate.text;
                var checkout = _todate.text;
                var firebaseUser = FirebaseAuth.instance.currentUser;
                await FirebaseFirestore.instance
                    .collection("users")
                    .doc(firebaseUser.uid)
                    .collection("trips")
                    .doc(tripname)
                    .collection("hotel")
                    .doc(keydata)
                    .set({
                  "checkin": checkin,
                  "checkout": checkout,
                  "room": room,
                  "name": name,
                  "key": keydata,
                }).then((_) {
                  loaddata();
                  print("likh gaya");
                  setState(() {
                    r = 1;
                  });

                  Navigator.of(context, rootNavigator: true).pop();
                });
              })
        ],
      ),
    );
  }

  void loaddata() async {
    var firebaseUser = FirebaseAuth.instance.currentUser;
    var detailprint = await FirebaseFirestore.instance
        .collection("users")
        .doc(firebaseUser.uid)
        .collection("trips")
        .doc(tripname)
        .collection("hotel")
        .doc(keydata)
        .get();
    fromdate = detailprint.data()["checkin"];
    todate = detailprint.data()["checkout"];
    room = detailprint.data()["room"];
    print("ho gaya");
    setState(() {
      done = 1;
    });
  }

  void funct() async {
    hotels = await FirebaseFirestore.instance
        .collection("fetch details")
        .doc("Allahabad")
        .collection('Hotels')
        .doc(keydata)
        .get();
    about = hotels.data()["About"];
    price = hotels.data()["price"];
    location = hotels.data()["location"];
    rating = hotels.data()["rating"];
    name = hotels.data()["name"];
    link = hotels.data()["link"];
    imagelink = hotels.data()["imagelink"];

    setState(() {
      load = 1;
    });
  }

  Widget review() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                child: Text(
                  "P",
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
                backgroundColor: Colors.brown,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              "Prashant",
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
              child: starrow(MainAxisAlignment.start, 16.5),
            ),
            Text("27/10/2020"),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
              "The hotel was fantastic offered lot of facilties but the food was not up to mark but since i loved to eat outside therefore I didn't faced much problem."),
        ),
        SizedBox(
          height: 50.0,
        ),
      ],
    );
  }

  Widget starrow(MainAxisAlignment align, double size) {
    return Row(
      mainAxisAlignment: align,
      children: [
        Icon(
          Icons.star,
          color: Colors.green,
          size: size,
        ),
        Icon(
          Icons.star,
          color: Colors.green,
          size: size,
        ),
        Icon(
          Icons.star,
          color: Colors.green,
          size: size,
        ),
        Icon(
          Icons.star,
          color: Colors.grey,
          size: size,
        ),
        Icon(
          Icons.star,
          color: Colors.grey,
          size: size,
        ),
      ],
    );
  }

  Widget bookingdetails() {
    if (done == 0)
      return SizedBox(
        height: 0.1,
      );
    else {
      return Padding(
        padding: EdgeInsets.all(10.0),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("checkin",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                child: Text(fromdate),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("checkout",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                child: Text(todate),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("room",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                child: Text(room),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget content() {
    return Scaffold(
      body: Container(
          child: ListView(
        children: [
          Stack(
            children: [
              Image.network(
                imagelink,
                width: 400,
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SeeMoreHotel();
                        },
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                left: 5.0,
                top: 10.0,
              ),
              Positioned(
                  child: Text(
                    name,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  left: 10.0,
                  bottom: 15.0)
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          bookingdetails(),
          Padding(
            padding: EdgeInsets.all(10.0),
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text("About",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 15.0),
                      child: Text(about),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Price",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                    child: Text(price),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("link",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                    child: Text(link),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Location",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                    child: Text(location),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Rating and Reviews",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.w500)),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(rating,
                          style: TextStyle(
                              fontSize: 55.0, fontWeight: FontWeight.w300)),
                      starrow(MainAxisAlignment.center, 12.0),
                      Text("35 reviews")
                    ],
                  ),
                  review(),
                  review(),
                  review(),
                  review(),
                ],
              ),
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(r);
          _showDialog();
          if (r == 1) print("ho gaya");
        },
        child: Icon(Icons.send),
        backgroundColor: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if ((load == 0) && (r == 0) && (done == 0))
      return Scaffold(
          appBar: AppBar(title: Text('Loading')), body: Text("Loading..."));
    else if ((load == 1) && (r == 0) && (done == 0))
      return content();
    else if ((load == 1) && (r == 1) && (done == 0))
      return Scaffold(
          appBar: AppBar(title: Text('Loading')), body: Text("Loading..."));
    else if ((load == 1) && (r == 1) && (done == 1))
      return content();
    else {
      return Scaffold(
          appBar: AppBar(title: Text('Error')), body: Text("Error Occured"));
    }
  }
}
