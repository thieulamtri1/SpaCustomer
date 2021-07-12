import 'package:flutter/material.dart';
import 'package:spa_and_beauty_staff/models/Package.dart';

import 'components/body.dart';

class CustomerBookingScreen extends StatefulWidget {
  final Datum package;
  const CustomerBookingScreen({Key key, this.package}) : super(key: key);

  @override
  _CustomerBookingScreenState createState() => _CustomerBookingScreenState();
}

class _CustomerBookingScreenState extends State<CustomerBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            "Đặt lịch hẹn",
          style: TextStyle(
            fontSize: 28,
            color: Colors.black
          ),
        ),
      ),
      body: BookingBody(package: widget.package, isBookNow: true,),
    );
  }
}
