import 'package:flutter/material.dart';
import 'package:travel_manager/screen/Trip/editableDetails.dart';
import 'package:travel_manager/screen/Trip/hotels/hotelprofile.dart';
import 'package:travel_manager/screen/Trip/hotels/seehotels.dart';

class TransportList extends StatefulWidget {
  var i;
  var name;
  var date;
  var time;
  var route;
  var price;
  var tripname;
  var keydata;
  TransportList(
      {this.i,
      this.name,
      this.date,
      this.route,
      this.price,
      this.time,
      this.keydata,
      this.tripname});

  @override
  _TransportListState createState() =>
      _TransportListState(i, name, date, route, price, time, keydata, tripname);
}

class _TransportListState extends State<TransportList> {
  var i;
  var name;
  var date;
  var time;
  var route;
  var price;
  var tripname;
  var keydata;
  List<String> detailtransfer = List();
  List<Icon> icontransfer = List();
  _TransportListState(var i, var name, var date, var route, var price, var time,
      var keydata, var tripname) {
    this.i = i;
    this.name = name;
    this.date = date;
    this.route = route;
    this.price = price;
    this.time = time;
    this.keydata = keydata;
    this.tripname = tripname;
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
                      child: Text(name),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                  child: Container(
                    child: Column(
                      children: [
                        details(Icon(Icons.date_range), date),
                        details(Icon(Icons.time_to_leave), time),
                        details(Icon(Icons.add_road), route),
                        details(Icon(Icons.money), price),
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
