import 'package:flutter/material.dart';
import 'package:travel_manager/screen/Trip/listTripItem.dart';
import 'package:travel_manager/screen/bootom_nav.dart';

class Trip extends StatefulWidget {
  @override
  _TripState createState() => _TripState();
}

class _TripState extends State<Trip> with TickerProviderStateMixin {
  TabController tb;
  List<Widget> items() {
    List<Widget> triplist = [];
    for (var i = 1; i <= 6; i++) {
      triplist.add(ListTrip(i: i));
    }
    return triplist;
  }

  Widget tripDispplay() {
    return Container(
      child: ListView(
        children: items(),
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
        title: Text(" My Trips"),
        bottom: TabBar(
          tabs: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Upcomming"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Completed"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text("Cancelled"),
            ),
          ],
          controller: tb,
        ),
      ),
      body: TabBarView(
        children: [
          tripDispplay(),
          tripDispplay(),
          tripDispplay(),
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
