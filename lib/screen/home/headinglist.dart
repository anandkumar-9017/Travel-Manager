import 'package:flutter/material.dart';

class HeadingList extends StatelessWidget {
  String heading;
  HeadingList({this.heading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$heading",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          FlatButton(
              onPressed: () {},
              child: Text("See All",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  )))
        ],
      ),
    );
  }
}
