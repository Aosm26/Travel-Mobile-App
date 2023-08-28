import 'package:flutter/material.dart';
import 'screens/booking.dart';

void main() {
  runApp(TravelMobileApp());
}
class TravelMobileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookingScreen(),
    );
  }
}
