import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StaffRowDetailsWidget extends StatelessWidget {
   StaffRowDetailsWidget({
    super.key,
    required this.firstField,
    required this.detailField,
  });
  String firstField;
  String detailField;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.1,
      // color: Colors.red,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Row(
        children: [
          // SizedBox(
          //   width: MediaQuery.of(context).size.width / 30,
          // ),
           SizedBox(
           
            height:  MediaQuery.of(context).size.height / 20,
            width: MediaQuery.of(context).size.width/3.5,
            child: Center(child: Text(firstField))),
          SizedBox(
            width: MediaQuery.of(context).size.width / 15,
          ),
          const VerticalDivider(
            color: Colors.grey,
          ),
          const SizedBox(
            width: 5,
          ),
           Text(detailField),
        ],
      ),
    );
  }
}