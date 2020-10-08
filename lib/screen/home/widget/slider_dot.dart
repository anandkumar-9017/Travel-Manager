import 'package:flutter/material.dart';
import 'package:travel_manager/constraint.dart';

class SliderDot extends StatelessWidget {
  const SliderDot({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical:20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal:3),
            width:10.0,
            height: 10.0,
            decoration :BoxDecoration(
              color: mPrimaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal:3),
            width:10.0,
            height: 10.0,
            decoration :BoxDecoration(
              color: mPrimaryColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal:3),
            width:10.0,
            height: 10.0,
            decoration :BoxDecoration(
              color: mPrimaryColor.withOpacity(0.4),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ],
      ),
    );
  }
}