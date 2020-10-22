import 'package:flutter/material.dart';
import 'package:travel_manager/screen/Trip/editableDetails.dart';

class TransportList extends StatefulWidget {
  var i;
  TransportList({this.i});

  @override
  _TransportListState createState() => _TransportListState(i);
}

class _TransportListState extends State<TransportList> {
  var i;
  _TransportListState(var i) {
    this.i = i;
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
    List<String> detailtransfer = <String>[
      '25-Oct 2020 16:30',
      'indigo Airbus-250',
      'Termianl 2, Delhi',
    ];
    List<Icon> icontransfer = <Icon>[
      Icon(Icons.date_range),
      Icon(Icons.flight_land),
      Icon(Icons.airport_shuttle)
    ];
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
                      child: Text("Flights"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                  child: Container(
                    child: Column(
                      children: [
                        details(Icon(Icons.date_range), "25-Oct 2020 16:30"),
                        details(Icon(Icons.flight_land), "indigo Airbus-250"),
                        details(
                            Icon(Icons.airport_shuttle), "Termianl 2, Delhi"),
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
