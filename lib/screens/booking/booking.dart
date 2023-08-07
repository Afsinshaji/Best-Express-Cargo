import 'package:best_seller/constant/const.dart';
import 'package:best_seller/screens/booking/cargo_screen.dart';
import 'package:best_seller/screens/booking/moving_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          // backgroundColor: mainConColor,
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Boo",
                  style: GoogleFonts.baloo2(
                      textStyle: Theme.of(context).textTheme.bodyLarge,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: mainConColor),
                ),
                Text(
                  "K",
                  style: GoogleFonts.baloo2(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "ing",
                  style: GoogleFonts.baloo2(
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: mainConColor,
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize:
                  Size.fromHeight(MediaQuery.of(context).size.height / 15),
              child: const TabBar(
                  indicatorColor: mainConColor,
                  unselectedLabelColor: whiteShade,
                  labelColor: whiteShade,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 4,
                  tabs: [
                    Tab(text: "Cargo"),
                    Tab(text: "Moving"),
                  ]),
            ),
          ),
          body: const TabBarView(children: [CargoScreen(), MovingScreen()])

          //  Expanded(
          //    child: ListView.builder(
          //     physics: const BouncingScrollPhysics(),
          //     itemCount: 22,
          //     itemBuilder: (context, index) =>  BookingTileWidget(index: index+1),

          //    ),
          //  ),
          // BookingContainerWidget(),

          ),
    );
  }
}
