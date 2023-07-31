import 'package:best_seller/constant/const.dart';
import 'package:best_seller/screens/attendence/attendance.dart';
import 'package:best_seller/screens/booking/booking.dart';
import 'package:best_seller/screens/dashboard/dashboard.dart';
import 'package:best_seller/screens/shipping/shipping.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

List<Widget> pages = [
  const DashBoardScreen(),
  const AttendanceScreen(),
  const BookingScreen(),
  const ShippingScreen(),
];
int index = 0;

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: SizedBox(
        
        height: MediaQuery.of(context).size.height / 9,
        child: FloatingNavbar(
          backgroundColor: logoBlue,
          iconSize: 18,
          onTap: (int val) => setState(() => index = val),
          currentIndex: index,
          items: [
            FloatingNavbarItem(icon: Icons.dashboard, title: 'Dashboard'),
            FloatingNavbarItem(icon: Icons.switch_account_rounded, title: 'Attendance'),
            FloatingNavbarItem(icon: Icons.book_online, title: 'Booking'),
            FloatingNavbarItem(icon: Icons.local_shipping , title: 'Shipment'),
          ],
        ),
      ),
      body: pages.elementAt(index),
    );
  }
}
