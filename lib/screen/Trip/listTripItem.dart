import 'package:flutter/material.dart';
import 'package:travel_manager/screen/Trip/TripProfile.dart';

class ListTrip extends StatefulWidget {
  var i;
  ListTrip({this.i});

  @override
  _ListTripState createState() => _ListTripState(i);
}

class _ListTripState extends State<ListTrip> {
  var i;
  _ListTripState(var i) {
    this.i = i;
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
              return TripProfile();
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
                    Text("$i. TripName"),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.place),
                        Text("   Delhi"),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.date_range),
                        Text("   25-Oct to 30-Oct"),
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
