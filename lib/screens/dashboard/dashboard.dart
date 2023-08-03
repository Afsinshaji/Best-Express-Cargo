import 'package:best_seller/constant/const.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height/10,
            width: MediaQuery.sizeOf(context).width,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: mainConColor,
              borderRadius: BorderRadius.circular(22)
            ),
            child: const ListTile(
              leading: Icon(Icons.fire_truck,size: 70,),

            ),
          )
        ],
      ),
    );
  }
}