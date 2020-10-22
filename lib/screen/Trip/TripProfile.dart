import 'package:flutter/material.dart';
import 'package:travel_manager/screen/Trip/hotels.dart';

import 'package:travel_manager/screen/Trip/overviewlist.dart';
import 'package:travel_manager/screen/Trip/transport.dart';
import 'package:travel_manager/screen/bootom_nav.dart';

class TripProfile extends StatefulWidget {
  @override
  _TripProfileState createState() => _TripProfileState();
}

class _TripProfileState extends State<TripProfile>
    with TickerProviderStateMixin {
  TabController tb;
  List<Widget> hotels() {
    List<Widget> hotellist = [];
    for (var i = 1; i <= 6; i++) {
      hotellist.add(HotelList(
        i: i,
      ));
    }
    return hotellist;
  }

  Widget Hotels() {
    return Container(
      child: ListView(
        children: hotels(),
      ),
    );
  }

  List<Widget> transp() {
    List<Widget> transplist = [];
    for (var i = 1; i <= 6; i++) {
      transplist.add(TransportList(
        i: i,
      ));
    }
    return transplist;
  }

  Widget Transport() {
    return Container(
      child: ListView(
        children: transp(),
      ),
    );
  }

  List<Widget> over() {
    List<Widget> overlist = [];
    for (var i = 1; i <= 6; i++) {
      overlist.add(Overview(
        i: i,
      ));
    }
    return overlist;
  }

  Widget OverView() {
    return Container(
      child: ListView(
        children: over(),
      ),
    );
  }

  @override
  void initState() {
    tb = TabController(
      length: 3,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(" TripName"),
        bottom: TabBar(
          tabs: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Hotels"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Transport"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Overview"),
            ),
          ],
          controller: tb,
        ),
      ),
      body: TabBarView(
        children: [
          Hotels(),
          Transport(),
          OverView(),
        ],
        controller: tb,
      ),
      bottomNavigationBar: BottomNav(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[900],
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
