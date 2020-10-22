import 'package:flutter/material.dart';
import 'package:travel_manager/screen/Trip/editableDetails.dart';

class HotelList extends StatefulWidget {
  var i;
  HotelList({this.i});

  @override
  _HotelListState createState() => _HotelListState(i);
}

class _HotelListState extends State<HotelList> {
  var i;
  _HotelListState(var i) {
    this.i = i;
  }
  List<String> detailtransfer = <String>[
    '25-Oct 2020',
    '30-Oct 2020',
    'Cannought Place, Delhi',
    '2 Dulex luxury room',
  ];
  List<Icon> icontransfer = <Icon>[
    Icon(Icons.date_range),
    Icon(Icons.calendar_today),
    Icon(Icons.location_city),
    Icon(Icons.room),
  ];
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditableDetails(detailtransfer, icontransfer);
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
                        details(Icon(Icons.date_range), "25-Oct 2020"),
                        details(Icon(Icons.calendar_today), "30-Oct 2020"),
                        details(Icon(Icons.location_city),
                            "Cannought Place, Delhi"),
                        details(Icon(Icons.room), "2 Dulex luxury room"),
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
