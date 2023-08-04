import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: mainConColor,
     body:Center(
            child: ClipRRect(
          child: Image.asset('asset/Best Express Cargo logo.png'),
        )) ,
    );
  }
}


