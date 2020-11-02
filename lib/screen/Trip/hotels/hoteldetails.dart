import 'package:flutter/material.dart';
import 'package:travel_manager/screen/Trip/hotels/hotelprofile.dart';
import 'package:travel_manager/screen/home/placeprofile.dart';

class HotelDetails extends StatefulWidget {
  var keydata;
  String placename;
  String location;
  String rating;
  String image;
  var tripname;
  HotelDetails(var keydata, String placename, String rating, String location,
      String image, var tripname) {
    this.keydata = keydata;
    this.placename = placename;
    this.rating = rating;
    this.image = image;
    this.location = location;
    this.tripname = tripname;
  }
  @override
  _HotelDetailsState createState() =>
      _HotelDetailsState(keydata, placename, rating, image, location, tripname);
}

class _HotelDetailsState extends State<HotelDetails> {
  var keydata;
  String placename;
  String location;
  String rating;
  String image;
  var tripname;
  _HotelDetailsState(var keydata, String placename, String rating, String image,
      String location, var tripname) {
    this.keydata = keydata;
    this.placename = placename;
    this.rating = rating;
    this.image = image;
    this.location = location;
    this.tripname = tripname;
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HotelProfile(keydata, tripname);
            },
          ),
        );
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
