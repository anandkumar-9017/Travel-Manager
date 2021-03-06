import 'package:flutter/material.dart';
import 'package:travel_manager/screen/Trip/TripProfile.dart';

class ListTrip extends StatefulWidget {
  var name;
  var fromdate;
  var todate;
  var tocity;

  var i;
  ListTrip({
    this.i,
    this.name,
    this.fromdate,
    this.todate,
    this.tocity,
  });

  @override
  _ListTripState createState() => _ListTripState(
        i,
        name,
        fromdate,
        todate,
        tocity,
      );
}

class _ListTripState extends State<ListTrip> {
  var i;
  var name;
  var fromdate;
  var todate;
  var tocity;

  _ListTripState(
    var i,
    var name,
    var fromdate,
    var todate,
    var tocity,
  ) {
    this.i = i;
    this.name = name;
    this.fromdate = fromdate;
    this.todate = todate;
    this.tocity = tocity;
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
              return TripProfile(name);
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
                  child: Image.asset(
                    'assets/images/lucknow_image.jpg',
                    height: 80,
                    width: 80,
                  ),
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("$i. $name"),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.place),
                        Text("   $tocity"),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.date_range),
                        Text("   $fromdate to \n$todate"),
                      ],
                    ),
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
