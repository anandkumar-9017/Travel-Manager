import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/hotelprofilehome.dart';

import 'package:travel_manager/screen/home/placesprofilehome.dart';
import 'package:travel_manager/screen/home/resprofilehome.dart';
import 'package:travel_manager/screen/home/shopprofilehome.dart';

class PlacesDetails extends StatefulWidget {
  var checkname;
  var keydata;
  String placename;
  String location;
  String rating;
  String image;
  PlacesDetails(var checkname, var keydata, String placename, String rating,
      String location, String image) {
    this.keydata = keydata;
    this.checkname = checkname;
    this.placename = placename;
    this.rating = rating;
    this.image = image;
    this.location = location;
  }
  @override
  _PlacesDetailsState createState() => _PlacesDetailsState(
      checkname, keydata, placename, rating, location, image);
}

class _PlacesDetailsState extends State<PlacesDetails> {
  var checkname;
  var keydata;
  String placename;
  String location;
  String rating;
  String image;
  _PlacesDetailsState(var checkname, var keydata, String placename,
      String rating, String location, String image) {
    this.keydata = keydata;
    this.checkname = checkname;
    this.placename = placename;
    this.rating = rating;
    this.image = image;
    this.location = location;
  }
  Widget starrow() {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.green,
          size: 12.0,
        ),
        Icon(
          Icons.star,
          color: Colors.green,
          size: 12.0,
        ),
        Icon(
          Icons.star,
          color: Colors.green,
          size: 12.0,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (checkname == 'Hotel') {
          print(keydata);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HotelProfile(keydata);
              },
            ),
          );
        } else if (checkname == 'Places to visit') {
          print(keydata);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PlacesProfile(keydata);
              },
            ),
          );
        } else if (checkname == 'Restaurents') {
          print(keydata);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ResProfile(keydata);
              },
            ),
          );
        } else if (checkname == 'Shopping Places') {
          print(keydata);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return ShopProfile(keydata);
              },
            ),
          );
        } else {
          print(checkname);
          print("fucking shit happened again");
        }
      },
      child: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Image.network(
                    image,
                    width: 100,
                    height: 100,
                  ),
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$placename"),
                    starrow(),
                    SizedBox(
                      height: 25.0,
                    ),
                    Text("$rating"),
                    Text("$location"),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
