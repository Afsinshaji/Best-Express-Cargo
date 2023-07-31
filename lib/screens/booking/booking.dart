import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      centerTitle: true,
        title:  Text(
          "Booking",
          style: GoogleFonts.aBeeZee(
                textStyle: Theme.of(context).textTheme.bodyLarge,
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
        ),
      ),
      body: const Center(
        child: Text("Booking",style: TextStyle(fontSize: 40),),
      ),
    );
  }
}