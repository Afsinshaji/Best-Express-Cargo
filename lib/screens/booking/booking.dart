import 'package:best_seller/screens/booking/widgets/booking_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: mainConColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Booking",
          style: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.bodyLarge,
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height / 15),
          child: Padding(
            padding: EdgeInsets.only(
                top: height / 30,
                left: width / 15,
                right: width / 15,
                bottom: height / 122),
            child: SizedBox(
              height: height / 22,
              child: const CupertinoSearchTextField(
                suffixIcon: Icon(
                  CupertinoIcons.xmark_circle_fill,
                  size: 22,
                ),
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            GridView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: 22,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return const BookingContainerWidget();
              },
            ),
            // BookingContainerWidget(),
          ],
        ),
      ),
      
    );
  }
}
