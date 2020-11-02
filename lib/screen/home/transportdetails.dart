import 'package:flutter/material.dart';
import 'package:travel_manager/screen/home/placeprofile.dart';

class Transportdetail extends StatefulWidget {
  var days;
  var duration;
  var fromtime;
  var fromcity;
  var tocity;
  var totime;
  var stop;
  var name;
  var price;

  Transportdetail(
    var days,
    var duration,
    var fromtime,
    var fromcity,
    var tocity,
    var totime,
    var stop,
    var name,
    var price,
  ) {
    this.days = days;
    this.duration = duration;
    this.fromcity = fromcity;
    this.tocity = tocity;
    this.totime = totime;
    this.fromtime = fromtime;
    this.name = name;
    this.price = price;
    this.stop = stop;
  }
  @override
  _TransportdetailState createState() => _TransportdetailState(
        days,
        duration,
        fromtime,
        fromcity,
        tocity,
        totime,
        stop,
        name,
        price,
      );
}

class _TransportdetailState extends State<Transportdetail> {
  var days;
  var duration;
  var fromtime;
  var fromcity;
  var tocity;
  var totime;
  var stop;
  var name;
  var price;

  _TransportdetailState(
    var days,
    var duration,
    var fromtime,
    var fromcity,
    var tocity,
    var totime,
    var stop,
    var name,
    var price,
  ) {
    this.days = days;
    this.duration = duration;
    this.fromcity = fromcity;
    this.tocity = tocity;
    this.totime = totime;
    this.fromtime = fromtime;
    this.name = name;
    this.price = price;
    this.stop = stop;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 15.0),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 14.0),
                    child: Text(
                      name,
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 14),
                          child: Icon(Icons.flight),
                        ),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fromtime,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    fromcity,
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ],
                              )),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              duration,
                              style: TextStyle(fontSize: 10),
                            ),
                            Divider(
                              thickness: 3.0,
                              height: 8.0,
                            ),
                            Text(
                              "$stop stop",
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        )),
                        Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    totime,
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    tocity,
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ],
                              )),
                        ),
                        Expanded(
                            child: Center(
                          child: Text(
                            "Rs $price",
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
