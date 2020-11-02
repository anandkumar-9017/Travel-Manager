import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/seemorehotel.dart';

class HotelProfile extends StatefulWidget {
  var keydata;
  var tripname;
  HotelProfile(var keydata) {
    this.keydata = keydata;
  }
  @override
  _HotelProfileState createState() => _HotelProfileState(keydata);
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

  _HotelProfileState(var keydata) {
    this.keydata = keydata;
  }

  var hotels;
  @override
  void initState() {
    funct();
    super.initState();
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
    );
  }

  @override
  Widget build(BuildContext context) {
    if (load == 1)
      return content();
    else
      return Scaffold(body: Text('loading....'));
  }
}
