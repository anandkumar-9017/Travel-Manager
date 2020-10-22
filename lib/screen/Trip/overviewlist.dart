import 'package:flutter/material.dart';
import 'package:travel_manager/screen/Trip/editableDetails.dart';

class Overview extends StatefulWidget {
  var i;
  Overview({this.i});

  @override
  _OverviewState createState() => _OverviewState(i);
}

class _OverviewState extends State<Overview> {
  var i;
  _OverviewState(var i) {
    this.i = i + 24;
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
      'Lucknow to delhi',
      'Star Hotel',
      'Red Fort',
      'Shiv Sagar',
    ];
    List<Icon> icontransfer = <Icon>[
      Icon(Icons.flight),
      Icon(Icons.hotel),
      Icon(Icons.tour),
      Icon(Icons.restaurant),
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
                      child: Text("$i/10/2020"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.0),
                  child: Container(
                    child: Column(
                      children: [
                        details(Icon(Icons.flight), "Lucknow to delhi"),
                        details(Icon(Icons.hotel), "Star Hotel"),
                        details(Icon(Icons.tour), "Red Fort"),
                        details(Icon(Icons.restaurant), "Shiv Sagar"),
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
