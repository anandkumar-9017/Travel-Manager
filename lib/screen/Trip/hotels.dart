import 'package:flutter/material.dart';
import 'package:travel_manager/screen/Trip/editableDetails.dart';
import 'package:travel_manager/screen/Trip/hotels/hotelprofile.dart';
import 'package:travel_manager/screen/Trip/hotels/seehotels.dart';

class HotelList extends StatefulWidget {
  var i;
  var name;
  var checkin;
  var checkout;
  var room;
  var tripname;
  var keydata;
  HotelList(
      {this.i,
      this.name,
      this.checkin,
      this.checkout,
      this.room,
      this.keydata,
      this.tripname});

  @override
  _HotelListState createState() =>
      _HotelListState(i, name, checkin, checkout, room, keydata, tripname);
}

class _HotelListState extends State<HotelList> {
  var i;
  var name;
  var checkin;
  var checkout;
  var room;
  var keydata;
  var tripname;
  List<String> detailtransfer = List();
  List<Icon> icontransfer = List();
  _HotelListState(var i, var name, var checkin, var checkout, var room,
      var keydata, var tripname) {
    this.i = i;
    this.name = name;
    this.checkout = checkout;
    this.checkin = checkin;
    this.room = room;
    this.keydata = keydata;
    this.tripname = tripname;
    function();
  }
  void function() {
    detailtransfer = <String>[
      checkin,
      checkout,
      name,
      room,
    ];
    icontransfer = <Icon>[
      Icon(Icons.date_range),
      Icon(Icons.calendar_today),
      Icon(Icons.location_city),
      Icon(Icons.room),
    ];
  }

  Widget details(Widget icon, String text) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, left: 25.0),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 5.0,
          ),
          Text("$text"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(keydata);
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
            borderRadius: BorderRadius.circular(10),
          ),
          child: IntrinsicWidth(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    color: Colors.lightBlue[200],
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
                      child: Text("Star Hotel"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                  child: Container(
                    child: Column(
                      children: [
                        details(Icon(Icons.date_range), checkin),
                        details(Icon(Icons.calendar_today), checkout),
                        details(Icon(Icons.location_city), name),
                        details(Icon(Icons.room), room),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
