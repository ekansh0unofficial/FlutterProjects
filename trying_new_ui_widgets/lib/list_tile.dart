// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:mess_mgmt/Global/models/coupon_data_model.dart';

// ignore: must_be_immutable
class MyListTile extends StatelessWidget {
//  final CouponDataModel coupon;
  MyListTile({
    super.key,
    /*required this.coupon*/
  });

  var isVeg = true;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Row(
      children: [
        Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(12)),
            child: RotatedBox(
              quarterTurns: 3,
              child: Text(
                "Breakfast",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            )),
        SizedBox(
          width: 2,
        ),
        Expanded(
          child: Container(
              padding: EdgeInsets.fromLTRB(8, 12, 8, 0),
              decoration: BoxDecoration(
                  color: Color.fromARGB(129, 15, 123, 211),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name of Person ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                        Text('Subtitle for the coupon ',
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w500)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                          child: Row(
                            children: [
                              Icon(Icons.phone,
                                  color:
                                      const Color.fromARGB(216, 255, 255, 255)),
                              SizedBox(width: 20),
                              Icon(Icons.chat,
                                  color:
                                      const Color.fromARGB(216, 255, 255, 255)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('100',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 28,
                              fontWeight: FontWeight.w500)),
                      SvgPicture.asset(
                        "assets/isVeg.svg",
                        width: 60,
                        height: 60,
                        colorFilter: ColorFilter.mode(
                            Color.fromARGB(255, 33, 134, 37), BlendMode.srcIn),
                      )
                    ],
                  )
                ],
              )),
        )
      ],
    ));
  }
}
