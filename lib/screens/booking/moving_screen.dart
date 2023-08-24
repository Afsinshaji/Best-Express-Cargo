import 'package:best_seller/providers/booking_moving_provider.dart';
import 'package:best_seller/screens/booking/widgets/booking_moving_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MovingScreen extends StatelessWidget {
  const MovingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: height / 60,
              left: width / 25,
              right: width / 25,
              bottom: height / 120),
          child: SizedBox(
            height: height / 22,
            child: const CupertinoSearchTextField(
              suffixIcon: Icon(
                CupertinoIcons.xmark_circle_fill,
                size: 22,
              ),
              backgroundColor: Color.fromARGB(255, 216, 211, 211),
            ),
          ),
        ),
        FutureBuilder(
          future: Provider.of<BookingMovingProvider>(context).movingResponse(context),
          builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error :${snapshot.error}"),
            );
          } else if (snapshot.data!.isEmpty) {
            return const Center(child:  Text("No Data Available"),);
          } else {
            final movingFullList = snapshot.data!;
            return Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: movingFullList.length,
                itemBuilder: (context, index) =>
                    BookingMovingTileWidget(index: index,snapShot: movingFullList),
              ),
            );
          }
        }),
      ],
    ));
  }
}
